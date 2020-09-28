import 'package:flutter/material.dart';
import 'package:todoApp/models/note.dart';
import 'package:provider/provider.dart';
import 'package:todoApp/models/user.dart';
import 'package:todoApp/screens/home/note_tile.dart';
import 'package:todoApp/services/database.dart';

class NoteList extends StatefulWidget {
  @override
  _NoteListState createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  @override
  Widget build(BuildContext context) {

    final notes = Provider.of<List<Note>>(context);
    final user = Provider.of<CustomUser>(context);


    try {
      return ListView.builder(
        itemCount: notes.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: Key(notes[index].id),
            onDismissed: (direction) {
              DatabaseService(uid: user.uid).removeNote(notes[index].id);
            },
            child: NoteTile(note: notes[index])
          );
        }
      );
    } catch(e) {
      return Container();
    }
   }
}