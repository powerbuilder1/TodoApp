import 'package:flutter/material.dart';
import 'package:todoApp/models/global.dart';
import 'package:todoApp/models/note.dart';

class NoteTile extends StatelessWidget {

  final Note note;
  NoteTile( {this.note} );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.3),
      alignment: Alignment.topLeft,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Text(
            note.title,
            style: redTodoTitle,
            ),
          SizedBox(height: 5.0),
          Text(
            note.mainPart,
            style: redText,
            ),
        ],
      ),
    );
  }
}