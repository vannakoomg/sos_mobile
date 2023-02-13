// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'test.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TestPage11 _$TestPage11FromJson(Map<String, dynamic> json) {
  return _TestPage11.fromJson(json);
}

/// @nodoc
mixin _$TestPage11 {
  int? get id => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  List<dynamic>? get profile => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TestPage11CopyWith<TestPage11> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TestPage11CopyWith<$Res> {
  factory $TestPage11CopyWith(
          TestPage11 value, $Res Function(TestPage11) then) =
      _$TestPage11CopyWithImpl<$Res, TestPage11>;
  @useResult
  $Res call({int? id, String? code, String? name, List<dynamic>? profile});
}

/// @nodoc
class _$TestPage11CopyWithImpl<$Res, $Val extends TestPage11>
    implements $TestPage11CopyWith<$Res> {
  _$TestPage11CopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? code = freezed,
    Object? name = freezed,
    Object? profile = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      profile: freezed == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TestPage11CopyWith<$Res>
    implements $TestPage11CopyWith<$Res> {
  factory _$$_TestPage11CopyWith(
          _$_TestPage11 value, $Res Function(_$_TestPage11) then) =
      __$$_TestPage11CopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? code, String? name, List<dynamic>? profile});
}

/// @nodoc
class __$$_TestPage11CopyWithImpl<$Res>
    extends _$TestPage11CopyWithImpl<$Res, _$_TestPage11>
    implements _$$_TestPage11CopyWith<$Res> {
  __$$_TestPage11CopyWithImpl(
      _$_TestPage11 _value, $Res Function(_$_TestPage11) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? code = freezed,
    Object? name = freezed,
    Object? profile = freezed,
  }) {
    return _then(_$_TestPage11(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      profile: freezed == profile
          ? _value._profile
          : profile // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TestPage11 implements _TestPage11 {
  _$_TestPage11({this.id, this.code, this.name, final List<dynamic>? profile})
      : _profile = profile;

  factory _$_TestPage11.fromJson(Map<String, dynamic> json) =>
      _$$_TestPage11FromJson(json);

  @override
  final int? id;
  @override
  final String? code;
  @override
  final String? name;
  final List<dynamic>? _profile;
  @override
  List<dynamic>? get profile {
    final value = _profile;
    if (value == null) return null;
    if (_profile is EqualUnmodifiableListView) return _profile;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'TestPage11(id: $id, code: $code, name: $name, profile: $profile)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TestPage11 &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._profile, _profile));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, code, name,
      const DeepCollectionEquality().hash(_profile));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TestPage11CopyWith<_$_TestPage11> get copyWith =>
      __$$_TestPage11CopyWithImpl<_$_TestPage11>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TestPage11ToJson(
      this,
    );
  }
}

abstract class _TestPage11 implements TestPage11 {
  factory _TestPage11(
      {final int? id,
      final String? code,
      final String? name,
      final List<dynamic>? profile}) = _$_TestPage11;

  factory _TestPage11.fromJson(Map<String, dynamic> json) =
      _$_TestPage11.fromJson;

  @override
  int? get id;
  @override
  String? get code;
  @override
  String? get name;
  @override
  List<dynamic>? get profile;
  @override
  @JsonKey(ignore: true)
  _$$_TestPage11CopyWith<_$_TestPage11> get copyWith =>
      throw _privateConstructorUsedError;
}
