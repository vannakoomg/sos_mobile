// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_QuestionModel _$$_QuestionModelFromJson(Map<String, dynamic> json) =>
    _$_QuestionModel(
      title: json['title'] as String?,
      image: json['image'] as List<dynamic>?,
      description: json['description'] as String?,
      answer: json['answer'] as String?,
      votes: json['votes'] as String?,
    );

Map<String, dynamic> _$$_QuestionModelToJson(_$_QuestionModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'image': instance.image,
      'description': instance.description,
      'answer': instance.answer,
      'votes': instance.votes,
    };
