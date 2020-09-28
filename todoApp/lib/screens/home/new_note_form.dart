import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoApp/models/user.dart';
import 'package:todoApp/services/database.dart';
import 'package:todoApp/models/note.dart';

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
          Text('Add a new note'),
          SizedBox(height: 20.0),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Title',
            ),
            validator: (val) => val.isEmpty ? 'Please enter a title' : null,
            onChanged: (val) => setState(() => title = val)
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'main note',
            ),
            validator: (val) => val.isEmpty ? 'Please enter a note' : null,
            onChanged: (val) => setState(() => mainPart = val)
          ),
          RaisedButton.icon(
            icon: Icon(Icons.add),
            label: Text('Add'),
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