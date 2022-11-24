import 'package:freezed_annotation/freezed_annotation.dart';

part 'question_model.freezed.dart';
part 'question_model.g.dart';

@freezed
class QuestionModel with _$QuestionModel {
  factory QuestionModel({
    String? title,
    List? image,
    String? description,
    String? answer,
    String? votes,
    dynamic key,
  }) = _QuestionModel;

  factory QuestionModel.fromJson(Map<String, dynamic> json) =>
      _$QuestionModelFromJson(json);
}
//  "title": 'What is mother of thom',
//  "image": [],
//  "description":'Mark Elliot Zuckerberg (/ˈzʌkərbɜːrɡ/; born May 14, 1984) is an American business magnate, internet entrepreneur, and philanthropist. He is known for co-founding the social media website Facebook and its parent company Meta Platforms (formerly Facebook, Inc.), of which he is the chairman, chief executive officer, and controlling shareholder.[1][2]',
//  "answer": '10',
//  "votes": '100',