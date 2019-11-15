import 'package:json_annotation/json_annotation.dart';

import 'option.dart';

part 'vote.g.dart';

@JsonSerializable(explicitToJson: true)
class Vote {

  Vote(this.id, this.option);

  String id;
  Option option;

  factory Vote.fromJson(Map<String, dynamic> json) => _$VoteFromJson(json);

  Map<String, dynamic> toJson() => _$VoteToJson(this);
}
