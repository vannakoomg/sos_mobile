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
  String? get apartment => throw _privateConstructorUsedError;
  @JsonKey(name: 'office_space')
  String? get officeSpace => throw _privateConstructorUsedError;

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
  $Res call(
      {String? apartment, @JsonKey(name: 'office_space') String? officeSpace});
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
    Object? apartment = freezed,
    Object? officeSpace = freezed,
  }) {
    return _then(_value.copyWith(
      apartment: freezed == apartment
          ? _value.apartment
          : apartment // ignore: cast_nullable_to_non_nullable
              as String?,
      officeSpace: freezed == officeSpace
          ? _value.officeSpace
          : officeSpace // ignore: cast_nullable_to_non_nullable
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
  $Res call(
      {String? apartment, @JsonKey(name: 'office_space') String? officeSpace});
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
    Object? apartment = freezed,
    Object? officeSpace = freezed,
  }) {
    return _then(_$_LanduageModel(
      freezed == apartment
          ? _value.apartment
          : apartment // ignore: cast_nullable_to_non_nullable
              as String?,
      freezed == officeSpace
          ? _value.officeSpace
          : officeSpace // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LanduageModel implements _LanduageModel {
  _$_LanduageModel(
      [this.apartment = 'Apartment',
      @JsonKey(name: 'office_space') this.officeSpace = 'Office Space']);

  factory _$_LanduageModel.fromJson(Map<String, dynamic> json) =>
      _$$_LanduageModelFromJson(json);

  @override
  @JsonKey()
  final String? apartment;
  @override
  @JsonKey(name: 'office_space')
  final String? officeSpace;

  @override
  String toString() {
    return 'LanduageModel(apartment: $apartment, officeSpace: $officeSpace)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LanduageModel &&
            (identical(other.apartment, apartment) ||
                other.apartment == apartment) &&
            (identical(other.officeSpace, officeSpace) ||
                other.officeSpace == officeSpace));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, apartment, officeSpace);

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
  factory _LanduageModel(
          [final String? apartment,
          @JsonKey(name: 'office_space') final String? officeSpace]) =
      _$_LanduageModel;

  factory _LanduageModel.fromJson(Map<String, dynamic> json) =
      _$_LanduageModel.fromJson;

  @override
  String? get apartment;
  @override
  @JsonKey(name: 'office_space')
  String? get officeSpace;
  @override
  @JsonKey(ignore: true)
  _$$_LanduageModelCopyWith<_$_LanduageModel> get copyWith =>
      throw _privateConstructorUsedError;
}
