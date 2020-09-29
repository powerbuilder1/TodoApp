import 'package:flutter/material.dart';
import 'package:todoApp/models/global.dart';
import 'package:todoApp/models/note.dart';
import 'package:todoApp/screens/home/new_note_form.dart';
import 'package:todoApp/screens/home/note_list.dart';

class NotePanel {

  final Note note;
  final bool add;

  NotePanel( {this.note, this.add} );

  void showNewNotePanel(BuildContext context){
      showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)), 
        backgroundColor: darkGreyColor,
        builder: (context) {
          return Container(
            height: 350.0,
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
            child: NoteForm(note: note != null ? note : null, add: add),
          );
      }).whenComplete(() => NoteList.of(context).setState(() => {})
     );
  }
}



