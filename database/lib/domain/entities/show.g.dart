// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'show.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ShowImpl _$$ShowImplFromJson(Map<String, dynamic> json) => _$ShowImpl(
  id: (json['id'] as num).toInt(),
  title: json['title'] as String,
  type: $enumDecode(_$ShowTypeEnumMap, json['type']),
  genre: json['genre'] as String,
  year: (json['year'] as num).toInt(),
  averageDurationMinutes: (json['average_duration_minutes'] as num).toInt(),
  status:
      $enumDecodeNullable(_$ShowStatusEnumMap, json['status']) ??
      ShowStatus.toWatch,
);

Map<String, dynamic> _$$ShowImplToJson(_$ShowImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'type': _$ShowTypeEnumMap[instance.type]!,
      'genre': instance.genre,
      'year': instance.year,
      'average_duration_minutes': instance.averageDurationMinutes,
      'status': _$ShowStatusEnumMap[instance.status]!,
    };

const _$ShowTypeEnumMap = {ShowType.series: 'series', ShowType.movie: 'movie'};

const _$ShowStatusEnumMap = {
  ShowStatus.toWatch: 'toWatch',
  ShowStatus.inProgress: 'inProgress',
  ShowStatus.watched: 'watched',
};
