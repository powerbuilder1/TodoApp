import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoApp/models/note.dart';
import 'package:todoApp/models/user.dart';
import 'package:todoApp/screens/home/note_list.dart';
import 'package:todoApp/services/auth.dart';
import 'package:todoApp/services/database.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<CustomUser>(context);
    final DatabaseService databaseService = DatabaseService(uid: user.uid);
    Note test = Note(title: 'Grundversorgung', mainPart: 'Pizza kaufen');

    return StreamProvider<List<Note>>.value(
      value: databaseService.notes,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.brown[400],
          title: Text('Notes'),
          elevation: 0.0,
          actions: [
            FlatButton.icon(
              icon: Icon(Icons.add_comment),
              label: Text('new note'),
              onPressed: () async {
                await DatabaseService(uid: user.uid).addNote(test);
              }
            ),
            FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('logout'),
              onPressed: () async {
                return await _auth.signOut(); 
              },
            ),
         ],
        ),
        body: Container(
          child: NoteList(),
        ),
      ),
    );
  }
}