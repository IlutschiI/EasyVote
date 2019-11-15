import 'package:easy_vote_backend/models/question.dart';
import 'package:easy_vote_backend/models/vote.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import "package:collection/collection.dart";

class ResultWidget extends StatefulWidget {
  final Question question;

  ResultWidget(this.question);

  @override
  _ResultWidgetState createState() => _ResultWidgetState();
}

class _ResultWidgetState extends State<ResultWidget> {
  final List<Color> colors = [Colors.red, Colors.blue, Colors.green, Colors.yellow, Colors.grey, Colors.orange, Colors.purple, Colors.cyan];
  final List<charts.Color> chart_colors = [
    charts.Color.fromHex(code: "#F44336"),
    charts.Color.fromHex(code: "#2196F3"),
    charts.Color.fromHex(code: "#4caf50"),
    charts.Color.fromHex(code: "#FFEB3B"),
    charts.Color.fromHex(code: "#9E9E9E"),
    charts.Color.fromHex(code: "#FF9800"),
    charts.Color.fromHex(code: "#9C27B0"),
    charts.Color.fromHex(code: "#00bcd4"),
    charts.Color.fromHex(code: "#3f51b5"),
    charts.Color.fromHex(code: "#cddc39"),
    charts.Color.fromHex(code: "#ff5722"),
  ];
  int touch_index = -1;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AspectRatio(
        aspectRatio: 1,
        child: charts.PieChart(
          createSectionData(),
          defaultRenderer: charts.ArcRendererConfig(arcWidth: 900000, arcRendererDecorators: [charts.ArcLabelDecorator()]),
        ));
  }

  List<charts.Series<Result, int>> createSectionData() {
    var groupBy2 = groupBy<Vote, String>(widget.question.votes, (vote) => vote.option.id);
    List<Result> data = [];
    int count = 0;
    groupBy2.forEach((key, value) {
      var res = Result(count, value.length, value.first.option.text);
      count++;
      data.add(res);
    });
    count = 0;
    return [
      charts.Series<Result, int>(
        id: "Votes",
        domainFn: (Result result, _) => result.index,
        measureFn: (Result result, _) => result.votes,
        data: data,
        labelAccessorFn: (Result result, _) => result.text,
        colorFn: (_, __) {
          var res_color = chart_colors[_.index];
          count++;
          return res_color;
        },
      )
    ];
  }

  charts.Color convertToColor(Color materialColor) {
    return null;
  }
}

class Result {
  int index;
  int votes;
  String text;

  Result(this.index, this.votes, this.text);
}
