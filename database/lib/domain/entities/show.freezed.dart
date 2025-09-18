// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'show.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Show _$ShowFromJson(Map<String, dynamic> json) {
  return _Show.fromJson(json);
}

/// @nodoc
mixin _$Show {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  ShowType get type => throw _privateConstructorUsedError;
  String get genre => throw _privateConstructorUsedError;
  int get year => throw _privateConstructorUsedError;
  @JsonKey(name: 'average_duration_minutes')
  int get averageDurationMinutes => throw _privateConstructorUsedError;
  @JsonKey(name: 'status')
  ShowStatus get status => throw _privateConstructorUsedError;

  /// Serializes this Show to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Show
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ShowCopyWith<Show> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShowCopyWith<$Res> {
  factory $ShowCopyWith(Show value, $Res Function(Show) then) =
      _$ShowCopyWithImpl<$Res, Show>;
  @useResult
  $Res call({
    int id,
    String title,
    ShowType type,
    String genre,
    int year,
    @JsonKey(name: 'average_duration_minutes') int averageDurationMinutes,
    @JsonKey(name: 'status') ShowStatus status,
  });
}

/// @nodoc
class _$ShowCopyWithImpl<$Res, $Val extends Show>
    implements $ShowCopyWith<$Res> {
  _$ShowCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Show
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? type = null,
    Object? genre = null,
    Object? year = null,
    Object? averageDurationMinutes = null,
    Object? status = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as ShowType,
            genre: null == genre
                ? _value.genre
                : genre // ignore: cast_nullable_to_non_nullable
                      as String,
            year: null == year
                ? _value.year
                : year // ignore: cast_nullable_to_non_nullable
                      as int,
            averageDurationMinutes: null == averageDurationMinutes
                ? _value.averageDurationMinutes
                : averageDurationMinutes // ignore: cast_nullable_to_non_nullable
                      as int,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as ShowStatus,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ShowImplCopyWith<$Res> implements $ShowCopyWith<$Res> {
  factory _$$ShowImplCopyWith(
    _$ShowImpl value,
    $Res Function(_$ShowImpl) then,
  ) = __$$ShowImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String title,
    ShowType type,
    String genre,
    int year,
    @JsonKey(name: 'average_duration_minutes') int averageDurationMinutes,
    @JsonKey(name: 'status') ShowStatus status,
  });
}

/// @nodoc
class __$$ShowImplCopyWithImpl<$Res>
    extends _$ShowCopyWithImpl<$Res, _$ShowImpl>
    implements _$$ShowImplCopyWith<$Res> {
  __$$ShowImplCopyWithImpl(_$ShowImpl _value, $Res Function(_$ShowImpl) _then)
    : super(_value, _then);

  /// Create a copy of Show
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? type = null,
    Object? genre = null,
    Object? year = null,
    Object? averageDurationMinutes = null,
    Object? status = null,
  }) {
    return _then(
      _$ShowImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as ShowType,
        genre: null == genre
            ? _value.genre
            : genre // ignore: cast_nullable_to_non_nullable
                  as String,
        year: null == year
            ? _value.year
            : year // ignore: cast_nullable_to_non_nullable
                  as int,
        averageDurationMinutes: null == averageDurationMinutes
            ? _value.averageDurationMinutes
            : averageDurationMinutes // ignore: cast_nullable_to_non_nullable
                  as int,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as ShowStatus,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ShowImpl implements _Show {
  const _$ShowImpl({
    required this.id,
    required this.title,
    required this.type,
    required this.genre,
    required this.year,
    @JsonKey(name: 'average_duration_minutes')
    required this.averageDurationMinutes,
    @JsonKey(name: 'status') this.status = ShowStatus.toWatch,
  });

  factory _$ShowImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShowImplFromJson(json);

  @override
  final int id;
  @override
  final String title;
  @override
  final ShowType type;
  @override
  final String genre;
  @override
  final int year;
  @override
  @JsonKey(name: 'average_duration_minutes')
  final int averageDurationMinutes;
  @override
  @JsonKey(name: 'status')
  final ShowStatus status;

  @override
  String toString() {
    return 'Show(id: $id, title: $title, type: $type, genre: $genre, year: $year, averageDurationMinutes: $averageDurationMinutes, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShowImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.genre, genre) || other.genre == genre) &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.averageDurationMinutes, averageDurationMinutes) ||
                other.averageDurationMinutes == averageDurationMinutes) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    title,
    type,
    genre,
    year,
    averageDurationMinutes,
    status,
  );

  /// Create a copy of Show
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ShowImplCopyWith<_$ShowImpl> get copyWith =>
      __$$ShowImplCopyWithImpl<_$ShowImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ShowImplToJson(this);
  }
}

abstract class _Show implements Show {
  const factory _Show({
    required final int id,
    required final String title,
    required final ShowType type,
    required final String genre,
    required final int year,
    @JsonKey(name: 'average_duration_minutes')
    required final int averageDurationMinutes,
    @JsonKey(name: 'status') final ShowStatus status,
  }) = _$ShowImpl;

  factory _Show.fromJson(Map<String, dynamic> json) = _$ShowImpl.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  ShowType get type;
  @override
  String get genre;
  @override
  int get year;
  @override
  @JsonKey(name: 'average_duration_minutes')
  int get averageDurationMinutes;
  @override
  @JsonKey(name: 'status')
  ShowStatus get status;

  /// Create a copy of Show
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ShowImplCopyWith<_$ShowImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
