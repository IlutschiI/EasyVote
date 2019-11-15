import 'dart:convert';

import 'package:easy_vote_backend/models/question.dart';
import 'package:easy_vote_backend/models/vote.dart';
import 'package:http/http.dart' as http;

class VoteService {
  static Future<Question> loadQuestion() async {
    var response = await http.get("http://192.168.0.213:8888/vote");
    var json = jsonDecode(response.body);
    return Question.fromJson(json);
  }

  static Future sendVote(Vote vote) async {
    var jsonEncode2 = jsonEncode(vote.toJson());
    var response = await http.post("http://192.168.0.213:8888/vote", body: jsonEncode2, headers: {"content-type": "application/json"});
  }
}
