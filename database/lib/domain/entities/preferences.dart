// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'enums.dart';

part 'preferences.freezed.dart';
part 'preferences.g.dart';

@freezed
class Preferences with _$Preferences {
  const factory Preferences({
    @JsonKey(name: 'genre_filter') String? genreFilter,
    @JsonKey(name: 'type_filter') ShowType? typeFilter,
    @JsonKey(name: 'sort_order') @Default(SortOrder.titleAsc) SortOrder sortOrder,
    @JsonKey(name: 'dark_mode') @Default(false) bool darkMode,
  }) = _Preferences;

  factory Preferences.fromJson(Map<String, dynamic> json) => _$PreferencesFromJson(json);
}


