// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'watching.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WatchingImpl _$$WatchingImplFromJson(Map<String, dynamic> json) =>
    _$WatchingImpl(
      showId: (json['show_id'] as num).toInt(),
      seasonId: (json['season_id'] as num).toInt(),
      episodeId: (json['episode_id'] as num).toInt(),
      progressMinutes: (json['progress_minutes'] as num).toInt(),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      streamUrl: json['stream_url'] as String?,
    );

Map<String, dynamic> _$$WatchingImplToJson(_$WatchingImpl instance) =>
    <String, dynamic>{
      'show_id': instance.showId,
      'season_id': instance.seasonId,
      'episode_id': instance.episodeId,
      'progress_minutes': instance.progressMinutes,
      'updated_at': instance.updatedAt.toIso8601String(),
      'stream_url': instance.streamUrl,
    };
