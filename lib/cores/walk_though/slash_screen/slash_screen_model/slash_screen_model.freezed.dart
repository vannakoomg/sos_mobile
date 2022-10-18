// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'slash_screen_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SlashScreenModel _$SlashScreenModelFromJson(Map<String, dynamic> json) {
  return _SlashScreenModel.fromJson(json);
}

/// @nodoc
mixin _$SlashScreenModel {
  String? get title => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SlashScreenModelCopyWith<SlashScreenModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SlashScreenModelCopyWith<$Res> {
  factory $SlashScreenModelCopyWith(
          SlashScreenModel value, $Res Function(SlashScreenModel) then) =
      _$SlashScreenModelCopyWithImpl<$Res, SlashScreenModel>;
  @useResult
  $Res call({String? title});
}

/// @nodoc
class _$SlashScreenModelCopyWithImpl<$Res, $Val extends SlashScreenModel>
    implements $SlashScreenModelCopyWith<$Res> {
  _$SlashScreenModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
  }) {
    return _then(_value.copyWith(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SlashScreenModelCopyWith<$Res>
    implements $SlashScreenModelCopyWith<$Res> {
  factory _$$_SlashScreenModelCopyWith(
          _$_SlashScreenModel value, $Res Function(_$_SlashScreenModel) then) =
      __$$_SlashScreenModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? title});
}

/// @nodoc
class __$$_SlashScreenModelCopyWithImpl<$Res>
    extends _$SlashScreenModelCopyWithImpl<$Res, _$_SlashScreenModel>
    implements _$$_SlashScreenModelCopyWith<$Res> {
  __$$_SlashScreenModelCopyWithImpl(
      _$_SlashScreenModel _value, $Res Function(_$_SlashScreenModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
  }) {
    return _then(_$_SlashScreenModel(
      freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SlashScreenModel implements _SlashScreenModel {
  _$_SlashScreenModel([this.title]);

  factory _$_SlashScreenModel.fromJson(Map<String, dynamic> json) =>
      _$$_SlashScreenModelFromJson(json);

  @override
  final String? title;

  @override
  String toString() {
    return 'SlashScreenModel(title: $title)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SlashScreenModel &&
            (identical(other.title, title) || other.title == title));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SlashScreenModelCopyWith<_$_SlashScreenModel> get copyWith =>
      __$$_SlashScreenModelCopyWithImpl<_$_SlashScreenModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SlashScreenModelToJson(
      this,
    );
  }
}

abstract class _SlashScreenModel implements SlashScreenModel {
  factory _SlashScreenModel([final String? title]) = _$_SlashScreenModel;

  factory _SlashScreenModel.fromJson(Map<String, dynamic> json) =
      _$_SlashScreenModel.fromJson;

  @override
  String? get title;
  @override
  @JsonKey(ignore: true)
  _$$_SlashScreenModelCopyWith<_$_SlashScreenModel> get copyWith =>
      throw _privateConstructorUsedError;
}
