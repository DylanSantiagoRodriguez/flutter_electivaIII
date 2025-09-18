// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'season.freezed.dart';
part 'season.g.dart';

@freezed
class Season with _$Season {
  const factory Season({
    required int id,
    @JsonKey(name: 'season_number') required int seasonNumber,
    @JsonKey(name: 'show_id') required int showId,
    @JsonKey(name: 'episodes_count') required int episodesCount,
  }) = _Season;

  factory Season.fromJson(Map<String, dynamic> json) => _$SeasonFromJson(json);
}


