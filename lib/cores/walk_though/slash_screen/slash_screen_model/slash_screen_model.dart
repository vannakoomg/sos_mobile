import 'package:freezed_annotation/freezed_annotation.dart';

part 'slash_screen_model.freezed.dart';
part 'slash_screen_model.g.dart';

@freezed
class SlashScreenModel with _$SlashScreenModel {
  factory SlashScreenModel([
    String? title,
  ]) = _SlashScreenModel;

  factory SlashScreenModel.fromJson(Map<String, dynamic> json) =>
      _$SlashScreenModelFromJson(json);
}
