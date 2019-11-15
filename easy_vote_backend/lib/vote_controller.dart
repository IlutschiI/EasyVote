import 'dart:convert';

import 'package:easy_vote_backend/easy_vote_backend.dart';
import 'package:easy_vote_backend/repositories/question_repository.dart';

import 'models/vote.dart';

class VoteController extends ResourceController {
  final repository = QuestionRepository();

  @Operation.get()
  FutureOr<Response> get_question() async {
    // TODO: implement handle
    return Response.ok(repository.question);
  }

  @Operation.post()
  FutureOr<Response> postVote(@Bind.body() Map<String, dynamic> body) async {
    Vote vote = Vote.fromJson(body);
    repository.question.votes.add(vote);
    return Response.ok(repository.question.toJson());
  }
}
