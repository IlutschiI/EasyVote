import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';

part 'option.g.dart';

@JsonSerializable()
class Option {
  Option(this.text, this.id);

  Option.withId(this.text) {
    id = Uuid().v1();
  }

  String id;
  String text;

  factory Option.fromJson(Map<String, dynamic> json) => _$OptionFromJson(json);

  Map<String, dynamic> toJson() => _$OptionToJson(this);
}
