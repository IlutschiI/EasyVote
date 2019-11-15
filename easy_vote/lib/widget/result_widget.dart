import 'package:easy_vote_backend/models/question.dart';
import 'package:easy_vote_backend/models/vote.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import "package:collection/collection.dart";

class ResultWidget extends StatefulWidget {
  final Question question;

  ResultWidget(this.question);

  @override
  _ResultWidgetState createState() => _ResultWidgetState();
}

class _ResultWidgetState extends State<ResultWidget> {
  final List<Color> colors = [Colors.red, Colors.blue, Colors.green, Colors.yellow, Colors.grey, Colors.orange, Colors.purple, Colors.cyan];
  int touch_index = -1;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return PieChart(
      PieChartData(
        sections: createSectionData(),
        pieTouchData: PieTouchData(touchCallback: (pieTouchResponse) {
          this.setState(() {
            if (pieTouchResponse.touchInput is FlLongPressEnd || pieTouchResponse.touchInput is FlPanEnd) {
              touch_index = -1;
            } else {
              touch_index = pieTouchResponse.touchedSectionIndex;
            }
          });
        }),
        centerSpaceRadius: 0
      ),
    );
  }

  List<PieChartSectionData> createSectionData() {
    var groupBy2 = groupBy<Vote, String>(widget.question.votes, (vote) => vote.option.id);
    List<PieChartSectionData> sections = [];
    int count = 0;
    groupBy2.forEach((key, value) {
      double radius = touch_index == count ? 130 : 110;
      sections.add(PieChartSectionData(
        value: value.length.toDouble(),
        title: value.first.option.text,
        color: colors[count],
        radius: radius,
      ));
      count++;
    });
    return sections;
  }
}
