import 'package:hive_flutter/hive_flutter.dart';
import 'package:database/domain/entities/preferences.dart';
import 'package:database/domain/entities/watching.dart';

// Hive stores lightweight, frequently changing app state: current watching and user preferences.
class HiveService {
  static const String watchingBoxName = 'watching';
  static const String preferencesBoxName = 'preferences';

  late Box<Map> watchingBox;
  late Box<Map> preferencesBox;

  Future<void> init() async {
    await Hive.initFlutter();
    watchingBox = await Hive.openBox<Map>(watchingBoxName);
    preferencesBox = await Hive.openBox<Map>(preferencesBoxName);
  }

  // Watching
  Watching? getCurrentWatching() {
    final data = watchingBox.get('current');
    if (data == null) return null;
    return Watching.fromJson(Map<String, dynamic>.from(data));
  }

  Future<void> setCurrentWatching(Watching watching) async {
    await watchingBox.put('current', watching.toJson());
  }

  Future<void> clearCurrentWatching() async {
    await watchingBox.delete('current');
  }

  Stream<Watching?> watchProgressStream() async* {
    yield getCurrentWatching();
    await for (final _ in watchingBox.watch(key: 'current')) {
      yield getCurrentWatching();
    }
  }

  // Preferences
  Preferences getPreferences() {
    final data = preferencesBox.get('prefs');
    if (data == null) return const Preferences();
    return Preferences.fromJson(Map<String, dynamic>.from(data));
  }

  Future<void> setPreferences(Preferences preferences) async {
    await preferencesBox.put('prefs', preferences.toJson());
  }

  Stream<Preferences> watchPreferences() async* {
    yield getPreferences();
    await for (final _ in preferencesBox.watch(key: 'prefs')) {
      yield getPreferences();
    }
  }
}


