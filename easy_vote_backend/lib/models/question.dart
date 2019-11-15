import 'package:easy_vote_backend/models/option.dart';
import 'package:easy_vote_backend/models/vote.dart';
import 'package:json_annotation/json_annotation.dart';

part 'question.g.dart';

@JsonSerializable()
class Question {
  String id;
  String text;
  List<Option> options;
  List<Vote> votes;

  Question(this.id, this.text, this.options, this.votes);

  factory Question.fromJson(Map<String, dynamic> json) => _$QuestionFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionToJson(this);

}
