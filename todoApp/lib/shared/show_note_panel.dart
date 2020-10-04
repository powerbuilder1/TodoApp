import 'package:flutter/material.dart';
import 'package:todoApp/models/global.dart';
import 'package:todoApp/models/note.dart';
import 'package:todoApp/screens/home/new_note_form.dart';
import 'package:todoApp/screens/home/note_list.dart';

class NotePanel {

  final Note note;
  final bool add;
  final String noteId;

  NotePanel( {this.note, this.add, this.noteId} );

  void showNewNotePanel(BuildContext context){
      showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)), 
        backgroundColor: darkGreyColor,
        builder: (context) {
          return SingleChildScrollView(
            child: Container(
              // height: 350.0,
              padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom, top: 30.0, left: 60.0, right: 60.0),
              // padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
              child: NoteForm(note: note != null ? note : null, add: add, noteId: noteId),
            )
          );
      });
  }
}



