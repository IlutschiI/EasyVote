// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Question _$QuestionFromJson(Map<String, dynamic> json) {
  return Question(
    json['id'] as String,
    json['text'] as String,
    (json['options'] as List)
        ?.map((e) =>
            e == null ? null : Option.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['votes'] as List)
        ?.map(
            (e) => e == null ? null : Vote.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$QuestionToJson(Question instance) => <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'options': instance.options,
      'votes': instance.votes,
    };
