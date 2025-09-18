// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'episode.freezed.dart';
part 'episode.g.dart';

@freezed
class Episode with _$Episode {
  const factory Episode({
    required int id,
    @JsonKey(name: 'episode_number') required int episodeNumber,
    @JsonKey(name: 'season_id') required int seasonId,
    @JsonKey(name: 'duration_minutes') required int durationMinutes,
    required bool watched,
    int? rating,
  }) = _Episode;

  factory Episode.fromJson(Map<String, dynamic> json) => _$EpisodeFromJson(json);
}


