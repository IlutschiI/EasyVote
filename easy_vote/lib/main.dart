import 'package:easy_vote/services/vote_service.dart';
import 'package:easy_vote/widget/question_widget.dart';
import 'package:easy_vote/widget/result_widget2.dart';
import 'package:easy_vote_backend/models/question.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool showResult = false;
  Question question;

  @override
  void initState() {
    VoteService.loadQuestion().then((question) => this.setState(() {
          this.question = question;
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[FlatButton(onPressed: loadAndShowResult, child: Text("show/hide result"))],
      ),
      body: Center(
          child: question == null
              ? Text("Hello World")
              : SingleChildScrollView(
                child: Column(
                    children: <Widget>[
                      QuestionWidget(question),
                      if (showResult) ResultWidget(question),
                    ],
                  ),
              )),
    );
  }

  Future loadAndShowResult() async {
    var question = await VoteService.loadQuestion();
    this.setState(() {
      this.question = question;
      showResult = !showResult;
    });
  }
}
