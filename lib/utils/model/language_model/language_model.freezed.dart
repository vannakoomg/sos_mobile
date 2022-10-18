// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'language_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LanduageModel _$LanduageModelFromJson(Map<String, dynamic> json) {
  return _LanduageModel.fromJson(json);
}

/// @nodoc
mixin _$LanduageModel {
  String? get Yes => throw _privateConstructorUsedError;
  String? get No => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LanduageModelCopyWith<LanduageModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LanduageModelCopyWith<$Res> {
  factory $LanduageModelCopyWith(
          LanduageModel value, $Res Function(LanduageModel) then) =
      _$LanduageModelCopyWithImpl<$Res, LanduageModel>;
  @useResult
  $Res call({String? Yes, String? No});
}

/// @nodoc
class _$LanduageModelCopyWithImpl<$Res, $Val extends LanduageModel>
    implements $LanduageModelCopyWith<$Res> {
  _$LanduageModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? Yes = freezed,
    Object? No = freezed,
  }) {
    return _then(_value.copyWith(
      Yes: freezed == Yes
          ? _value.Yes
          : Yes // ignore: cast_nullable_to_non_nullable
              as String?,
      No: freezed == No
          ? _value.No
          : No // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LanduageModelCopyWith<$Res>
    implements $LanduageModelCopyWith<$Res> {
  factory _$$_LanduageModelCopyWith(
          _$_LanduageModel value, $Res Function(_$_LanduageModel) then) =
      __$$_LanduageModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? Yes, String? No});
}

/// @nodoc
class __$$_LanduageModelCopyWithImpl<$Res>
    extends _$LanduageModelCopyWithImpl<$Res, _$_LanduageModel>
    implements _$$_LanduageModelCopyWith<$Res> {
  __$$_LanduageModelCopyWithImpl(
      _$_LanduageModel _value, $Res Function(_$_LanduageModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? Yes = freezed,
    Object? No = freezed,
  }) {
    return _then(_$_LanduageModel(
      freezed == Yes
          ? _value.Yes
          : Yes // ignore: cast_nullable_to_non_nullable
              as String?,
      freezed == No
          ? _value.No
          : No // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LanduageModel implements _LanduageModel {
  _$_LanduageModel([this.Yes, this.No]);

  factory _$_LanduageModel.fromJson(Map<String, dynamic> json) =>
      _$$_LanduageModelFromJson(json);

  @override
  final String? Yes;
  @override
  final String? No;

  @override
  String toString() {
    return 'LanduageModel(Yes: $Yes, No: $No)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LanduageModel &&
            (identical(other.Yes, Yes) || other.Yes == Yes) &&
            (identical(other.No, No) || other.No == No));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, Yes, No);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LanduageModelCopyWith<_$_LanduageModel> get copyWith =>
      __$$_LanduageModelCopyWithImpl<_$_LanduageModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LanduageModelToJson(
      this,
    );
  }
}

abstract class _LanduageModel implements LanduageModel {
  factory _LanduageModel([final String? Yes, final String? No]) =
      _$_LanduageModel;

  factory _LanduageModel.fromJson(Map<String, dynamic> json) =
      _$_LanduageModel.fromJson;

  @override
  String? get Yes;
  @override
  String? get No;
  @override
  @JsonKey(ignore: true)
  _$$_LanduageModelCopyWith<_$_LanduageModel> get copyWith =>
      throw _privateConstructorUsedError;
}
