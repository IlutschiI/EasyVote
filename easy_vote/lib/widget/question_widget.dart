import 'package:easy_vote/widget/options_widget.dart';
import 'package:easy_vote_backend/models/question.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class QuestionWidget extends StatelessWidget {
  final Question question;

  final VoidCallback onOptionSelected;

  QuestionWidget(this.question, this.onOptionSelected);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: Container(
        margin: EdgeInsets.all(5),
        width: 600,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              question.text,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            OptionsWidget(question.options, onOptionSelected),
          ],
        ),
      ),
    );
  }
}
