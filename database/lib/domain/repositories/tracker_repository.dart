import 'package:database/domain/entities/episode.dart';
import 'package:database/domain/entities/preferences.dart';
import 'package:database/domain/entities/season.dart';
import 'package:database/domain/entities/show.dart';
import 'package:database/domain/entities/watching.dart';
import 'package:database/domain/entities/enums.dart';

abstract class TrackerRepository {
  // CRUD Shows
  Future<List<Show>> searchShows({String? query, String? genre, ShowType? type});
  Future<Show?> getShow(int id);
  Future<void> upsertShow(Show show);
  Future<void> deleteShow(int id);

  // Seasons & Episodes
  Future<List<Season>> getSeasonsByShow(int showId);
  Future<List<Episode>> getEpisodesBySeason(int seasonId);
  Future<void> markEpisodeWatched(int episodeId, bool watched);
  Future<void> rateEpisode(int episodeId, int rating);

  // Watching (Hive)
  Future<Watching?> getCurrentWatching();
  Future<void> setCurrentWatching(Watching watching);
  Future<void> clearCurrentWatching();

  // Progress updates (Hive)
  Stream<Watching?> watchProgressStream();

  // Preferences (Hive)
  Future<Preferences> getPreferences();
  Future<void> setPreferences(Preferences preferences);
  Stream<Preferences> watchPreferences();

  // Stats (mostly SQLite with JOINs)
  Future<Map<String, double>> totalHoursWatchedByGenre();
  Future<int> seasonFinalesWatchedBetween(int startHourInclusive, int endHourExclusive);
  Future<String?> mostPausedShowTitle();

  // Export SQLite database
  Future<String> exportDatabaseToFile(String targetDirectoryPath);
}


