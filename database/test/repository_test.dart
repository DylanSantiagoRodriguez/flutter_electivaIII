import 'package:database/data/datasources/hive_service.dart';
import 'package:database/data/datasources/sqlite_helper.dart';
import 'package:database/data/repositories/tracker_repository_impl.dart';
import 'package:database/domain/entities/enums.dart';
import 'package:database/domain/entities/season.dart';
import 'package:database/domain/entities/show.dart';
import 'package:database/domain/entities/watching.dart';
import 'package:database/domain/repositories/tracker_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TestSqliteHelper extends SqliteHelper {
  TestSqliteHelper(String dir) : super(overrideDirectoryPath: dir);
}

class TestHiveService extends HiveService {}

void main() {
  late TrackerRepository repo;

  setUpAll(() async {
    final tempDir = Directory.systemTemp.createTempSync('dbtest');
    final sqlite = TestSqliteHelper(tempDir.path);
    final hive = TestHiveService();
    final hiveDir = Directory.systemTemp.createTempSync('hivetest');
    await Hive.initFlutter(hiveDir.path);
    await Hive.openBox<Map>(HiveService.watchingBoxName);
    await Hive.openBox<Map>(HiveService.preferencesBoxName);
    repo = TrackerRepositoryImpl(sqlite: sqlite, hive: hive);
  });

  test('Upsert and search shows', () async {
    await repo.upsertShow(Show(id: 1, title: 'Breaking Bad', type: ShowType.series, genre: 'Drama', year: 2008, averageDurationMinutes: 47));
    final list = await repo.searchShows(query: 'Break');
    expect(list.length, 1);
    expect(list.first.title, 'Breaking Bad');
  });

  test('Seasons and Episodes CRUD basics', () async {
    final sqlite = (repo as TrackerRepositoryImpl).sqlite;
    final db = await sqlite.database;
    await db.insert('seasons', {'id': 1, 'season_number': 1, 'show_id': 1, 'episodes_count': 2});
    await db.insert('episodes', {'id': 1, 'episode_number': 1, 'season_id': 1, 'duration_minutes': 47, 'watched': 0});
    await db.insert('episodes', {'id': 2, 'episode_number': 2, 'season_id': 1, 'duration_minutes': 48, 'watched': 0});

    final seasons = await repo.getSeasonsByShow(1);
    expect(seasons, [Season(id: 1, seasonNumber: 1, showId: 1, episodesCount: 2)]);

    final eps = await repo.getEpisodesBySeason(1);
    expect(eps.length, 2);

    await repo.markEpisodeWatched(1, true);
    final eps2 = await repo.getEpisodesBySeason(1);
    expect(eps2.firstWhere((e) => e.id == 1).watched, true);

    await repo.rateEpisode(2, 9);
    final eps3 = await repo.getEpisodesBySeason(1);
    expect(eps3.firstWhere((e) => e.id == 2).rating, 9);
  });

  test('Watching progress via Hive', () async {
    final w = Watching(showId: 1, seasonId: 1, episodeId: 1, progressMinutes: 10, updatedAt: DateTime.now());
    await repo.setCurrentWatching(w);
    final current = await repo.getCurrentWatching();
    expect(current?.episodeId, 1);
  });
}
