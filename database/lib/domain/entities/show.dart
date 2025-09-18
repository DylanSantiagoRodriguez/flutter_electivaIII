// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'enums.dart';

part 'show.freezed.dart';
part 'show.g.dart';

@freezed
class Show with _$Show {
  const factory Show({
    required int id,
    required String title,
    required ShowType type,
    required String genre,
    required int year,
    @JsonKey(name: 'average_duration_minutes') required int averageDurationMinutes,
    @JsonKey(name: 'status') @Default(ShowStatus.toWatch) ShowStatus status,
  }) = _Show;

  factory Show.fromJson(Map<String, dynamic> json) => _$ShowFromJson(json);
}


