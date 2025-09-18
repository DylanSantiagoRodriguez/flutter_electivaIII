// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'preferences.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Preferences _$PreferencesFromJson(Map<String, dynamic> json) {
  return _Preferences.fromJson(json);
}

/// @nodoc
mixin _$Preferences {
  @JsonKey(name: 'genre_filter')
  String? get genreFilter => throw _privateConstructorUsedError;
  @JsonKey(name: 'type_filter')
  ShowType? get typeFilter => throw _privateConstructorUsedError;
  @JsonKey(name: 'sort_order')
  SortOrder get sortOrder => throw _privateConstructorUsedError;
  @JsonKey(name: 'dark_mode')
  bool get darkMode => throw _privateConstructorUsedError;

  /// Serializes this Preferences to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Preferences
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PreferencesCopyWith<Preferences> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PreferencesCopyWith<$Res> {
  factory $PreferencesCopyWith(
    Preferences value,
    $Res Function(Preferences) then,
  ) = _$PreferencesCopyWithImpl<$Res, Preferences>;
  @useResult
  $Res call({
    @JsonKey(name: 'genre_filter') String? genreFilter,
    @JsonKey(name: 'type_filter') ShowType? typeFilter,
    @JsonKey(name: 'sort_order') SortOrder sortOrder,
    @JsonKey(name: 'dark_mode') bool darkMode,
  });
}

/// @nodoc
class _$PreferencesCopyWithImpl<$Res, $Val extends Preferences>
    implements $PreferencesCopyWith<$Res> {
  _$PreferencesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Preferences
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? genreFilter = freezed,
    Object? typeFilter = freezed,
    Object? sortOrder = null,
    Object? darkMode = null,
  }) {
    return _then(
      _value.copyWith(
            genreFilter: freezed == genreFilter
                ? _value.genreFilter
                : genreFilter // ignore: cast_nullable_to_non_nullable
                      as String?,
            typeFilter: freezed == typeFilter
                ? _value.typeFilter
                : typeFilter // ignore: cast_nullable_to_non_nullable
                      as ShowType?,
            sortOrder: null == sortOrder
                ? _value.sortOrder
                : sortOrder // ignore: cast_nullable_to_non_nullable
                      as SortOrder,
            darkMode: null == darkMode
                ? _value.darkMode
                : darkMode // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PreferencesImplCopyWith<$Res>
    implements $PreferencesCopyWith<$Res> {
  factory _$$PreferencesImplCopyWith(
    _$PreferencesImpl value,
    $Res Function(_$PreferencesImpl) then,
  ) = __$$PreferencesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'genre_filter') String? genreFilter,
    @JsonKey(name: 'type_filter') ShowType? typeFilter,
    @JsonKey(name: 'sort_order') SortOrder sortOrder,
    @JsonKey(name: 'dark_mode') bool darkMode,
  });
}

/// @nodoc
class __$$PreferencesImplCopyWithImpl<$Res>
    extends _$PreferencesCopyWithImpl<$Res, _$PreferencesImpl>
    implements _$$PreferencesImplCopyWith<$Res> {
  __$$PreferencesImplCopyWithImpl(
    _$PreferencesImpl _value,
    $Res Function(_$PreferencesImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Preferences
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? genreFilter = freezed,
    Object? typeFilter = freezed,
    Object? sortOrder = null,
    Object? darkMode = null,
  }) {
    return _then(
      _$PreferencesImpl(
        genreFilter: freezed == genreFilter
            ? _value.genreFilter
            : genreFilter // ignore: cast_nullable_to_non_nullable
                  as String?,
        typeFilter: freezed == typeFilter
            ? _value.typeFilter
            : typeFilter // ignore: cast_nullable_to_non_nullable
                  as ShowType?,
        sortOrder: null == sortOrder
            ? _value.sortOrder
            : sortOrder // ignore: cast_nullable_to_non_nullable
                  as SortOrder,
        darkMode: null == darkMode
            ? _value.darkMode
            : darkMode // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PreferencesImpl implements _Preferences {
  const _$PreferencesImpl({
    @JsonKey(name: 'genre_filter') this.genreFilter,
    @JsonKey(name: 'type_filter') this.typeFilter,
    @JsonKey(name: 'sort_order') this.sortOrder = SortOrder.titleAsc,
    @JsonKey(name: 'dark_mode') this.darkMode = false,
  });

  factory _$PreferencesImpl.fromJson(Map<String, dynamic> json) =>
      _$$PreferencesImplFromJson(json);

  @override
  @JsonKey(name: 'genre_filter')
  final String? genreFilter;
  @override
  @JsonKey(name: 'type_filter')
  final ShowType? typeFilter;
  @override
  @JsonKey(name: 'sort_order')
  final SortOrder sortOrder;
  @override
  @JsonKey(name: 'dark_mode')
  final bool darkMode;

  @override
  String toString() {
    return 'Preferences(genreFilter: $genreFilter, typeFilter: $typeFilter, sortOrder: $sortOrder, darkMode: $darkMode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PreferencesImpl &&
            (identical(other.genreFilter, genreFilter) ||
                other.genreFilter == genreFilter) &&
            (identical(other.typeFilter, typeFilter) ||
                other.typeFilter == typeFilter) &&
            (identical(other.sortOrder, sortOrder) ||
                other.sortOrder == sortOrder) &&
            (identical(other.darkMode, darkMode) ||
                other.darkMode == darkMode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, genreFilter, typeFilter, sortOrder, darkMode);

  /// Create a copy of Preferences
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PreferencesImplCopyWith<_$PreferencesImpl> get copyWith =>
      __$$PreferencesImplCopyWithImpl<_$PreferencesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PreferencesImplToJson(this);
  }
}

abstract class _Preferences implements Preferences {
  const factory _Preferences({
    @JsonKey(name: 'genre_filter') final String? genreFilter,
    @JsonKey(name: 'type_filter') final ShowType? typeFilter,
    @JsonKey(name: 'sort_order') final SortOrder sortOrder,
    @JsonKey(name: 'dark_mode') final bool darkMode,
  }) = _$PreferencesImpl;

  factory _Preferences.fromJson(Map<String, dynamic> json) =
      _$PreferencesImpl.fromJson;

  @override
  @JsonKey(name: 'genre_filter')
  String? get genreFilter;
  @override
  @JsonKey(name: 'type_filter')
  ShowType? get typeFilter;
  @override
  @JsonKey(name: 'sort_order')
  SortOrder get sortOrder;
  @override
  @JsonKey(name: 'dark_mode')
  bool get darkMode;

  /// Create a copy of Preferences
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PreferencesImplCopyWith<_$PreferencesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
