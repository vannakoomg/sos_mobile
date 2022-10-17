import 'package:freezed_annotation/freezed_annotation.dart';

part 'language_model.freezed.dart';
part 'language_model.g.dart';

@freezed
abstract class LanduageModel with _$LanduageModel {
  factory LanduageModel([
    @Default('Apartment') String? apartment,
    @JsonKey(name: 'office_space') @Default('Office Space') String? officeSpace,
  ]) = _LanduageModel;

  factory LanduageModel.fromJson(Map<String, dynamic> json) =>
      _$LanduageModelFromJson(json);
}
