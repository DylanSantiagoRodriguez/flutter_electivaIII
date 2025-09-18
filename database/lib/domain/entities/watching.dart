// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'watching.freezed.dart';
part 'watching.g.dart';

@freezed
class Watching with _$Watching {
  const factory Watching({
    @JsonKey(name: 'show_id') required int showId,
    @JsonKey(name: 'season_id') required int seasonId,
    @JsonKey(name: 'episode_id') required int episodeId,
    @JsonKey(name: 'progress_minutes') required int progressMinutes,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    @JsonKey(name: 'stream_url') String? streamUrl,
  }) = _Watching;

  factory Watching.fromJson(Map<String, dynamic> json) => _$WatchingFromJson(json);
}


