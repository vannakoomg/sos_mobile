import 'package:freezed_annotation/freezed_annotation.dart';

part 'language_model.freezed.dart';
part 'language_model.g.dart';

@freezed
abstract class LanduageModel with _$LanduageModel {
  factory LanduageModel([
    String? Yes,
    String? No,
  ]) = _LanduageModel;

  factory LanduageModel.fromJson(Map<String, dynamic> json) =>
      _$LanduageModelFromJson(json);
}
