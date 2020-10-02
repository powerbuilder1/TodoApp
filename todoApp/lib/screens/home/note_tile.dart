import 'package:flutter/material.dart';
import 'package:todoApp/models/global.dart';
import 'package:todoApp/models/note.dart';
import 'package:todoApp/models/user.dart';
import 'package:provider/provider.dart';
import 'package:todoApp/services/database.dart';

class NoteTile extends StatefulWidget {

  final Note note;
  NoteTile( {this.note} );

  @override
  _NoteTileState createState() => _NoteTileState();
}

class _NoteTileState extends State<NoteTile> {

  bool checkedValue = false;

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<CustomUser>(context);

    return Container(
      margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.3),
      alignment: Alignment.topLeft,
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          Checkbox(
            value: checkedValue,
            onChanged: (newValue) async {
              setState(() {
                checkedValue = newValue;
              });
              if (newValue) {
                print('edit');
                print(widget.note.id);
                await DatabaseService(uid: user.uid).editNote(Note(finished: true), widget.note.id);
              }
            },
          ), 
          Column(
            children: [
              Text(
                widget.note.title,
                style: redTodoTitle,
                ),
              SizedBox(height: 5.0),
              Text(
                widget.note.mainPart,
                style: redText,
                ),
            ],
          ),
        ],
      ),
    );
  }
}