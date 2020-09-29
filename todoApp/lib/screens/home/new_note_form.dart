import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoApp/models/global.dart';
import 'package:todoApp/models/user.dart';
import 'package:todoApp/services/database.dart';
import 'package:todoApp/models/note.dart';
import 'package:todoApp/shared.dart/constants.dart';

class NoteForm extends StatefulWidget {
  @override
  _NoteFormState createState() => _NoteFormState();
}

class _NoteFormState extends State<NoteForm> {

  final _formKey = GlobalKey<FormState>();

  String title;
  String mainPart;

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<CustomUser>(context);

    return Form(
      key: _formKey,
      child: Column(
        children: [
          Text(
            'Add a new note',
            style: TextStyle(
              fontSize: 25.0,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 50.0),
          TextFormField(
            decoration: textInputDecoration.copyWith(hintText: 'Title'),
            validator: (val) => val.isEmpty ? 'Please enter a title' : null,
            onChanged: (val) => setState(() => title = val)
          ),
          SizedBox(height: 20.0),
          TextFormField(
            decoration: textInputDecoration.copyWith(hintText: 'Note'), 
            validator: (val) => val.isEmpty ? 'Please enter a note' : null,
            onChanged: (val) => setState(() => mainPart = val)
          ),
          SizedBox(height: 20.0),
          RaisedButton.icon(
            color: redColor,
            icon: Icon(
              Icons.add,
              ),
            label: Text(
              'Add',
              ),
            onPressed: () async {
              if(_formKey.currentState.validate()){
                await DatabaseService(uid: user.uid).addNote(Note(
                  title: title,
                  mainPart: mainPart,
                ));
                Navigator.pop(context);
              }
            }
          ),
        ],
      )
    ); 
  }
}