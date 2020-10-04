import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoApp/models/global.dart';
import 'package:todoApp/models/user.dart';
import 'package:todoApp/services/database.dart';
import 'package:todoApp/models/note.dart';
import 'package:todoApp/shared/constants.dart';

class NoteForm extends StatefulWidget {

  final dynamic note;
  final bool add;
  final String noteId;

  NoteForm( {this.note, this.add, this.noteId} );

  @override
  _NoteFormState createState() => _NoteFormState();
}

class _NoteFormState extends State<NoteForm> {

  final _formKey = GlobalKey<FormState>();

  dynamic title;
  dynamic mainPart;

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<CustomUser>(context);
    final DatabaseService databaseService = DatabaseService(uid: user.uid);

    return Form(
      key: _formKey,
      child: Column(
        children: [
          Text(
            widget.add ? 'Add a new note' : 'Edit note',
            style: TextStyle(
              fontSize: 25.0,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 50.0),
          TextFormField(
            initialValue: widget.note != null ? widget.note.title : '',
            decoration: textInputDecoration.copyWith(hintText: 'Title'),
            validator: (val) => val.isEmpty ? 'Please enter a title' : null,
            onChanged: (val) => setState(() => title = val)
          ),
          SizedBox(height: 20.0),
          TextFormField(
            initialValue: widget.note != null ? widget.note.mainPart : '',
            decoration: textInputDecoration.copyWith(hintText: 'Note'), 
            validator: (val) => val.isEmpty ? 'Please enter a note' : null,
            onChanged: (val) => setState(() => mainPart = val)
          ),
          SizedBox(height: 20.0),
          RaisedButton.icon(
            color: widget.add ? redColor : Colors.yellow[900],
            icon: widget.add ? Icon(Icons.add) : Icon(Icons.edit),
            label: widget.add ? Text('Add') : Text('Edit'),
            onPressed: () async {
              if(_formKey.currentState.validate()){
                if(widget.add == true){
                  await databaseService.addNote(Note(
                    title: title,
                    mainPart: mainPart,
                  ));
                  Navigator.pop(context);
                } else {
                  print(title);
                  print(mainPart);
                  await databaseService.editNote(Note(
                    title: title,
                    mainPart: mainPart,
                  ), widget.noteId);
                  Navigator.pop(context);
                }
              }
            }
          ),
          SizedBox(height: 20.0)
        ],
      )
    ); 
  }
}