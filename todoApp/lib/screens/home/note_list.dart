import 'package:flutter/material.dart';
import 'package:todoApp/models/note.dart';
import 'package:provider/provider.dart';
import 'package:todoApp/screens/home/note_tile.dart';

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
          return NoteTile(note: notes[index]);
        }
      );
    } catch(e) {
      return Container();
    }
   }
}