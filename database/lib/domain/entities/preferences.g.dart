// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'preferences.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PreferencesImpl _$$PreferencesImplFromJson(Map<String, dynamic> json) =>
    _$PreferencesImpl(
      genreFilter: json['genre_filter'] as String?,
      typeFilter: $enumDecodeNullable(_$ShowTypeEnumMap, json['type_filter']),
      sortOrder:
          $enumDecodeNullable(_$SortOrderEnumMap, json['sort_order']) ??
          SortOrder.titleAsc,
      darkMode: json['dark_mode'] as bool? ?? false,
    );

Map<String, dynamic> _$$PreferencesImplToJson(_$PreferencesImpl instance) =>
    <String, dynamic>{
      'genre_filter': instance.genreFilter,
      'type_filter': _$ShowTypeEnumMap[instance.typeFilter],
      'sort_order': _$SortOrderEnumMap[instance.sortOrder]!,
      'dark_mode': instance.darkMode,
    };

const _$ShowTypeEnumMap = {ShowType.series: 'series', ShowType.movie: 'movie'};

const _$SortOrderEnumMap = {
  SortOrder.titleAsc: 'titleAsc',
  SortOrder.titleDesc: 'titleDesc',
  SortOrder.yearAsc: 'yearAsc',
  SortOrder.yearDesc: 'yearDesc',
};
