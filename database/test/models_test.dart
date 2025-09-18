import 'package:database/domain/entities/episode.dart';
import 'package:database/domain/entities/enums.dart';
import 'package:database/domain/entities/preferences.dart';
import 'package:database/domain/entities/season.dart';
import 'package:database/domain/entities/show.dart';
import 'package:database/domain/entities/watching.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Show toJson/fromJson', () {
    final s = Show(id: 1, title: 'Test', type: ShowType.series, genre: 'Drama', year: 2024, averageDurationMinutes: 45);
    final json = s.toJson();
    final s2 = Show.fromJson(json);
    expect(s2, s);
  });

  test('Season toJson/fromJson', () {
    final m = Season(id: 1, seasonNumber: 2, showId: 1, episodesCount: 10);
    final json = m.toJson();
    final m2 = Season.fromJson(json);
    expect(m2, m);
  });

  test('Episode toJson/fromJson', () {
    final e = Episode(id: 1, episodeNumber: 3, seasonId: 1, durationMinutes: 50, watched: false, rating: null);
    final json = e.toJson();
    final e2 = Episode.fromJson(json);
    expect(e2, e);
  });

  test('Watching toJson/fromJson', () {
    final w = Watching(showId: 1, seasonId: 1, episodeId: 2, progressMinutes: 25, updatedAt: DateTime(2024, 1, 1));
    final json = w.toJson();
    final w2 = Watching.fromJson(json);
    expect(w2, w);
  });

  test('Preferences toJson/fromJson', () {
    final p = Preferences(genreFilter: 'Drama', typeFilter: ShowType.series, sortOrder: SortOrder.titleDesc, darkMode: true);
    final json = p.toJson();
    final p2 = Preferences.fromJson(json);
    expect(p2, p);
  });
}
