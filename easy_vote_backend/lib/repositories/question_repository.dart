import 'package:easy_vote_backend/models/option.dart';
import 'package:easy_vote_backend/models/question.dart';
import 'package:uuid/uuid.dart';

class QuestionRepository {
  factory QuestionRepository() {
    return _questionRepository;
  }

  QuestionRepository._internal() {
    question =
        Question(Uuid().v1(), "What's your favorite programming language?", [
      Option.withId("Dart"),
      Option.withId("Java"),
      Option.withId("Python"),
      Option.withId("C#"),
      Option.withId("Swift"),
      Option.withId("Kotlin"),
    ], []);
  }

  Question question;

  static final QuestionRepository _questionRepository =
      QuestionRepository._internal();
}
