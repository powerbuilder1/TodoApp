import 'package:flutter/material.dart';
import 'package:todoApp/models/note.dart';
import 'package:provider/provider.dart';

class NoteList extends StatefulWidget {
  @override
  _NoteListState createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  @override
  Widget build(BuildContext context) {

    final notes = Provider.of<List<Note>>(context);


    try {
      return ListView.builder(
        itemCount: notes.length,
        itemBuilder: (context, index) {
          return Container(
            child: Column(
              children: [
                Text(notes[index].title),
                Text(notes[index].mainPart),
              ],
            ),
          );
        }
      );
    } catch(e) {
      return Container();
    }
   }
}