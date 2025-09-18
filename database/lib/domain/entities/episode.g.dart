// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'episode.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EpisodeImpl _$$EpisodeImplFromJson(Map<String, dynamic> json) =>
    _$EpisodeImpl(
      id: (json['id'] as num).toInt(),
      episodeNumber: (json['episode_number'] as num).toInt(),
      seasonId: (json['season_id'] as num).toInt(),
      durationMinutes: (json['duration_minutes'] as num).toInt(),
      watched: json['watched'] as bool,
      rating: (json['rating'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$EpisodeImplToJson(_$EpisodeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'episode_number': instance.episodeNumber,
      'season_id': instance.seasonId,
      'duration_minutes': instance.durationMinutes,
      'watched': instance.watched,
      'rating': instance.rating,
    };
