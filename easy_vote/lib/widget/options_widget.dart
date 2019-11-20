import 'package:easy_vote/services/vote_service.dart';
import 'package:easy_vote_backend/models/option.dart';
import 'package:easy_vote_backend/models/vote.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:uuid/uuid.dart';

class OptionsWidget extends StatelessWidget {
  final List<Option> options;
  final VoidCallback onOptionSelected;

  const OptionsWidget(this.options, this.onOptionSelected);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: options.length,
          itemBuilder: (_, int index) {
            var option = options[index];
            return ListTile(
              onTap: () => postVote(option),
              leading: Icon(Icons.send),
              title: Text(option.text),
            );
          }),
    );
  }

  Future postVote(Option option) async {
    var vote =Vote(Uuid().v1(), option);
    VoteService.sendVote(vote);
    onOptionSelected();
  }
}
