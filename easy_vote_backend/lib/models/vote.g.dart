// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vote.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Vote _$VoteFromJson(Map<String, dynamic> json) {
  return Vote(
    json['id'] as String,
    json['option'] == null
        ? null
        : Option.fromJson(json['option'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$VoteToJson(Vote instance) => <String, dynamic>{
      'id': instance.id,
      'option': instance.option,
    };
