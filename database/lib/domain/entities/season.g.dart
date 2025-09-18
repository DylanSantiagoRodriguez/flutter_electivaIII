// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'season.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SeasonImpl _$$SeasonImplFromJson(Map<String, dynamic> json) => _$SeasonImpl(
  id: (json['id'] as num).toInt(),
  seasonNumber: (json['season_number'] as num).toInt(),
  showId: (json['show_id'] as num).toInt(),
  episodesCount: (json['episodes_count'] as num).toInt(),
);

Map<String, dynamic> _$$SeasonImplToJson(_$SeasonImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'season_number': instance.seasonNumber,
      'show_id': instance.showId,
      'episodes_count': instance.episodesCount,
    };
