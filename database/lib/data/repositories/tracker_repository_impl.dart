import 'package:database/data/datasources/hive_service.dart';
import 'package:database/data/datasources/sqlite_helper.dart';
import 'package:database/domain/entities/episode.dart';
import 'package:database/domain/entities/preferences.dart';
import 'package:database/domain/entities/season.dart';
import 'package:database/domain/entities/show.dart';
import 'package:database/domain/entities/enums.dart';
import 'package:database/domain/entities/watching.dart';
import 'package:database/domain/repositories/tracker_repository.dart';
import 'package:sqflite/sqflite.dart';

class TrackerRepositoryImpl implements TrackerRepository {
  final SqliteHelper sqlite;
  final HiveService hive;

  TrackerRepositoryImpl({required this.sqlite, required this.hive});

  @override
  Future<void> deleteShow(int id) async {
    final db = await sqlite.database;
    await db.delete('shows', where: 'id = ?', whereArgs: [id]);
  }

  @override
  Future<Show?> getShow(int id) async {
    final db = await sqlite.database;
    final rows = await db.query('shows', where: 'id = ?', whereArgs: [id]);
    if (rows.isEmpty) return null;
    final map = rows.first;
    return Show.fromJson(_decodeShow(map));
  }

  Map<String, dynamic> _decodeShow(Map<String, Object?> map) {
    return {
      'id': map['id'],
      'title': map['title'],
      'type': (map['type'] as String) == 'series' ? ShowType.series.name : ShowType.movie.name,
      'genre': map['genre'],
      'year': map['year'],
      'average_duration_minutes': map['average_duration_minutes'],
    };
  }

  Map<String, Object?> _encodeShow(Show show) {
    return {
      'id': show.id,
      'title': show.title,
      'type': show.type.name,
      'genre': show.genre,
      'year': show.year,
      'average_duration_minutes': show.averageDurationMinutes,
      'status': show.status.name,
    };
  }

  @override
  Future<void> upsertShow(Show show) async {
    final db = await sqlite.database;
    await db.insert(
      'shows',
      _encodeShow(show),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<List<Show>> searchShows({String? query, String? genre, ShowType? type, ShowStatus? status}) async {
    final db = await sqlite.database;
    final where = <String>[];
    final args = <Object?>[];
    if (query != null && query.isNotEmpty) {
      where.add('title LIKE ?');
      args.add('%$query%');
    }
    if (genre != null && genre.isNotEmpty) {
      where.add('genre = ?');
      args.add(genre);
    }
    if (type != null) {
      where.add('type = ?');
      args.add(type.name);
    }
    if (status != null) {
      where.add('status = ?');
      args.add(status.name);
    }
    final rows = await db.query('shows', where: where.isEmpty ? null : where.join(' AND '), whereArgs: args, orderBy: 'title ASC');
    return rows.map((m) => Show.fromJson(_decodeShow(m))).toList();
  }

  @override
  Future<List<Season>> getSeasonsByShow(int showId) async {
    final db = await sqlite.database;
    final rows = await db.query('seasons', where: 'show_id = ?', whereArgs: [showId], orderBy: 'season_number ASC');
    return rows
        .map((m) => Season.fromJson({
              'id': m['id'],
              'season_number': m['season_number'],
              'show_id': m['show_id'],
              'episodes_count': m['episodes_count'],
            }))
        .toList();
  }

  @override
  Future<List<Episode>> getEpisodesBySeason(int seasonId) async {
    final db = await sqlite.database;
    final rows = await db.query('episodes', where: 'season_id = ?', whereArgs: [seasonId], orderBy: 'episode_number ASC');
    return rows
        .map((m) => Episode.fromJson({
              'id': m['id'],
              'episode_number': m['episode_number'],
              'season_id': m['season_id'],
              'duration_minutes': m['duration_minutes'],
              'watched': (m['watched'] as int) == 1,
              'rating': m['rating'],
            }))
        .toList();
  }

  @override
  Future<void> markEpisodeWatched(int episodeId, bool watched) async {
    final db = await sqlite.database;
    await db.update(
      'episodes',
      {
        'watched': watched ? 1 : 0,
        'watched_at': watched ? DateTime.now().millisecondsSinceEpoch : null,
      },
      where: 'id = ?',
      whereArgs: [episodeId],
    );
  }

  @override
  Future<void> rateEpisode(int episodeId, int rating) async {
    final db = await sqlite.database;
    await db.update('episodes', {'rating': rating}, where: 'id = ?', whereArgs: [episodeId]);
  }

  // Hive-backed
  @override
  Future<Watching?> getCurrentWatching() async => hive.getCurrentWatching();

  @override
  Future<void> setCurrentWatching(Watching watching) => hive.setCurrentWatching(watching);

  @override
  Future<void> clearCurrentWatching() => hive.clearCurrentWatching();

  @override
  Stream<Watching?> watchProgressStream() => hive.watchProgressStream();

  @override
  Future<Preferences> getPreferences() async => hive.getPreferences();

  @override
  Future<void> setPreferences(Preferences preferences) => hive.setPreferences(preferences);

  @override
  Stream<Preferences> watchPreferences() => hive.watchPreferences();

  // Stats
  @override
  Future<Map<String, double>> totalHoursWatchedByGenre() async {
    final db = await sqlite.database;
    final rows = await db.rawQuery('''
      SELECT s.genre as genre, SUM(e.duration_minutes) as minutes
      FROM episodes e
      JOIN seasons se ON se.id = e.season_id
      JOIN shows s ON s.id = se.show_id
      WHERE e.watched = 1
      GROUP BY s.genre
    ''');
    final Map<String, double> result = {};
    for (final r in rows) {
      final minutes = (r['minutes'] as num?)?.toDouble() ?? 0;
      result[r['genre'] as String] = minutes / 60.0;
    }
    return result;
  }

  @override
  Future<int> seasonFinalesWatchedBetween(int startHourInclusive, int endHourExclusive) async {
    final db = await sqlite.database;
    final rows = await db.rawQuery('''
      SELECT COUNT(*) as cnt
      FROM episodes e
      JOIN seasons se ON se.id = e.season_id
      WHERE e.watched = 1
        AND e.episode_number = se.episodes_count
        AND strftime('%H', datetime(e.watched_at/1000, 'unixepoch')) >= printf('%02d', ?)
        AND strftime('%H', datetime(e.watched_at/1000, 'unixepoch')) < printf('%02d', ?)
    ''', [startHourInclusive, endHourExclusive]);
    final count = (rows.first['cnt'] as int?) ?? (rows.first['cnt'] as num?)?.toInt() ?? 0;
    return count;
  }

  @override
  Future<String?> mostPausedShowTitle() async {
    // Heuristic: count number of times progress saved in Hive for a show without marking episode watched
    // We'll read a rolling log stored in Hive under key 'pause_log' (list of maps)
    // If absent, return null.
    // Note: For simplicity in this sample, we don't store a dedicated log; returning null.
    return null;
  }

  @override
  Future<String> exportDatabaseToFile(String targetDirectoryPath) async {
    return sqlite.exportTo(targetDirectoryPath);
  }
}


