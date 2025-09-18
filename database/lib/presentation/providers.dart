import 'package:database/data/datasources/hive_service.dart';
import 'package:database/data/datasources/sqlite_helper.dart';
import 'package:database/data/repositories/tracker_repository_impl.dart';
import 'package:database/domain/entities/enums.dart';
import 'package:database/domain/entities/preferences.dart';
import 'package:database/domain/entities/show.dart';
import 'package:database/domain/entities/watching.dart';
import 'package:database/domain/repositories/tracker_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

// Core singletons
final sqliteProvider = Provider<SqliteHelper>((ref) => SqliteHelper());
final hiveServiceProvider = Provider<HiveService>((ref) => HiveService());

final repositoryProvider = Provider<TrackerRepository>((ref) {
  final sqlite = ref.read(sqliteProvider);
  final hive = ref.read(hiveServiceProvider);
  return TrackerRepositoryImpl(sqlite: sqlite, hive: hive);
});

// Preferences
final preferencesProvider = StreamProvider<Preferences>((ref) async* {
  final repo = ref.read(repositoryProvider);
  yield await repo.getPreferences();
  yield* repo.watchPreferences();
});

// Theme
final themeModeProvider = Provider<ThemeMode>((ref) {
  final prefs = ref.watch(preferencesProvider).maybeWhen(data: (p) => p, orElse: () => const Preferences());
  return (prefs.darkMode) ? ThemeMode.dark : ThemeMode.light;
});

// Shows list with filters
class ShowsFilter extends StateNotifier<({String query, String? genre, ShowType? type, ShowStatus? status})> {
  ShowsFilter() : super((query: '', genre: null, type: null, status: null));

  void setQuery(String q) => state = (query: q, genre: state.genre, type: state.type, status: state.status);
  void setGenre(String? g) => state = (query: state.query, genre: g, type: state.type, status: state.status);
  void setType(ShowType? t) => state = (query: state.query, genre: state.genre, type: t, status: state.status);
  void setStatus(ShowStatus? s) => state = (query: state.query, genre: state.genre, type: state.type, status: s);
}

final showsFilterProvider = StateNotifierProvider<ShowsFilter, ({String query, String? genre, ShowType? type, ShowStatus? status})>((ref) => ShowsFilter());

final showsListProvider = FutureProvider<List<Show>>((ref) async {
  final repo = ref.read(repositoryProvider);
  final f = ref.watch(showsFilterProvider);
  return repo.searchShows(query: f.query, genre: f.genre, type: f.type, status: f.status);
});

// Current watching
final nowWatchingStreamProvider = StreamProvider<Watching?>((ref) {
  final repo = ref.read(repositoryProvider);
  return repo.watchProgressStream();
});


