// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'watching.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Watching _$WatchingFromJson(Map<String, dynamic> json) {
  return _Watching.fromJson(json);
}

/// @nodoc
mixin _$Watching {
  @JsonKey(name: 'show_id')
  int get showId => throw _privateConstructorUsedError;
  @JsonKey(name: 'season_id')
  int get seasonId => throw _privateConstructorUsedError;
  @JsonKey(name: 'episode_id')
  int get episodeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'progress_minutes')
  int get progressMinutes => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'stream_url')
  String? get streamUrl => throw _privateConstructorUsedError;

  /// Serializes this Watching to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Watching
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WatchingCopyWith<Watching> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WatchingCopyWith<$Res> {
  factory $WatchingCopyWith(Watching value, $Res Function(Watching) then) =
      _$WatchingCopyWithImpl<$Res, Watching>;
  @useResult
  $Res call({
    @JsonKey(name: 'show_id') int showId,
    @JsonKey(name: 'season_id') int seasonId,
    @JsonKey(name: 'episode_id') int episodeId,
    @JsonKey(name: 'progress_minutes') int progressMinutes,
    @JsonKey(name: 'updated_at') DateTime updatedAt,
    @JsonKey(name: 'stream_url') String? streamUrl,
  });
}

/// @nodoc
class _$WatchingCopyWithImpl<$Res, $Val extends Watching>
    implements $WatchingCopyWith<$Res> {
  _$WatchingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Watching
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? showId = null,
    Object? seasonId = null,
    Object? episodeId = null,
    Object? progressMinutes = null,
    Object? updatedAt = null,
    Object? streamUrl = freezed,
  }) {
    return _then(
      _value.copyWith(
            showId: null == showId
                ? _value.showId
                : showId // ignore: cast_nullable_to_non_nullable
                      as int,
            seasonId: null == seasonId
                ? _value.seasonId
                : seasonId // ignore: cast_nullable_to_non_nullable
                      as int,
            episodeId: null == episodeId
                ? _value.episodeId
                : episodeId // ignore: cast_nullable_to_non_nullable
                      as int,
            progressMinutes: null == progressMinutes
                ? _value.progressMinutes
                : progressMinutes // ignore: cast_nullable_to_non_nullable
                      as int,
            updatedAt: null == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            streamUrl: freezed == streamUrl
                ? _value.streamUrl
                : streamUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$WatchingImplCopyWith<$Res>
    implements $WatchingCopyWith<$Res> {
  factory _$$WatchingImplCopyWith(
    _$WatchingImpl value,
    $Res Function(_$WatchingImpl) then,
  ) = __$$WatchingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'show_id') int showId,
    @JsonKey(name: 'season_id') int seasonId,
    @JsonKey(name: 'episode_id') int episodeId,
    @JsonKey(name: 'progress_minutes') int progressMinutes,
    @JsonKey(name: 'updated_at') DateTime updatedAt,
    @JsonKey(name: 'stream_url') String? streamUrl,
  });
}

/// @nodoc
class __$$WatchingImplCopyWithImpl<$Res>
    extends _$WatchingCopyWithImpl<$Res, _$WatchingImpl>
    implements _$$WatchingImplCopyWith<$Res> {
  __$$WatchingImplCopyWithImpl(
    _$WatchingImpl _value,
    $Res Function(_$WatchingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Watching
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? showId = null,
    Object? seasonId = null,
    Object? episodeId = null,
    Object? progressMinutes = null,
    Object? updatedAt = null,
    Object? streamUrl = freezed,
  }) {
    return _then(
      _$WatchingImpl(
        showId: null == showId
            ? _value.showId
            : showId // ignore: cast_nullable_to_non_nullable
                  as int,
        seasonId: null == seasonId
            ? _value.seasonId
            : seasonId // ignore: cast_nullable_to_non_nullable
                  as int,
        episodeId: null == episodeId
            ? _value.episodeId
            : episodeId // ignore: cast_nullable_to_non_nullable
                  as int,
        progressMinutes: null == progressMinutes
            ? _value.progressMinutes
            : progressMinutes // ignore: cast_nullable_to_non_nullable
                  as int,
        updatedAt: null == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        streamUrl: freezed == streamUrl
            ? _value.streamUrl
            : streamUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$WatchingImpl implements _Watching {
  const _$WatchingImpl({
    @JsonKey(name: 'show_id') required this.showId,
    @JsonKey(name: 'season_id') required this.seasonId,
    @JsonKey(name: 'episode_id') required this.episodeId,
    @JsonKey(name: 'progress_minutes') required this.progressMinutes,
    @JsonKey(name: 'updated_at') required this.updatedAt,
    @JsonKey(name: 'stream_url') this.streamUrl,
  });

  factory _$WatchingImpl.fromJson(Map<String, dynamic> json) =>
      _$$WatchingImplFromJson(json);

  @override
  @JsonKey(name: 'show_id')
  final int showId;
  @override
  @JsonKey(name: 'season_id')
  final int seasonId;
  @override
  @JsonKey(name: 'episode_id')
  final int episodeId;
  @override
  @JsonKey(name: 'progress_minutes')
  final int progressMinutes;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;
  @override
  @JsonKey(name: 'stream_url')
  final String? streamUrl;

  @override
  String toString() {
    return 'Watching(showId: $showId, seasonId: $seasonId, episodeId: $episodeId, progressMinutes: $progressMinutes, updatedAt: $updatedAt, streamUrl: $streamUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WatchingImpl &&
            (identical(other.showId, showId) || other.showId == showId) &&
            (identical(other.seasonId, seasonId) ||
                other.seasonId == seasonId) &&
            (identical(other.episodeId, episodeId) ||
                other.episodeId == episodeId) &&
            (identical(other.progressMinutes, progressMinutes) ||
                other.progressMinutes == progressMinutes) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.streamUrl, streamUrl) ||
                other.streamUrl == streamUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    showId,
    seasonId,
    episodeId,
    progressMinutes,
    updatedAt,
    streamUrl,
  );

  /// Create a copy of Watching
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WatchingImplCopyWith<_$WatchingImpl> get copyWith =>
      __$$WatchingImplCopyWithImpl<_$WatchingImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WatchingImplToJson(this);
  }
}

abstract class _Watching implements Watching {
  const factory _Watching({
    @JsonKey(name: 'show_id') required final int showId,
    @JsonKey(name: 'season_id') required final int seasonId,
    @JsonKey(name: 'episode_id') required final int episodeId,
    @JsonKey(name: 'progress_minutes') required final int progressMinutes,
    @JsonKey(name: 'updated_at') required final DateTime updatedAt,
    @JsonKey(name: 'stream_url') final String? streamUrl,
  }) = _$WatchingImpl;

  factory _Watching.fromJson(Map<String, dynamic> json) =
      _$WatchingImpl.fromJson;

  @override
  @JsonKey(name: 'show_id')
  int get showId;
  @override
  @JsonKey(name: 'season_id')
  int get seasonId;
  @override
  @JsonKey(name: 'episode_id')
  int get episodeId;
  @override
  @JsonKey(name: 'progress_minutes')
  int get progressMinutes;
  @override
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt;
  @override
  @JsonKey(name: 'stream_url')
  String? get streamUrl;

  /// Create a copy of Watching
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WatchingImplCopyWith<_$WatchingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
