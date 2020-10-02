import 'package:flutter/material.dart';
import 'package:todoApp/models/note.dart';
import 'package:provider/provider.dart';
import 'package:todoApp/models/user.dart';
import 'package:todoApp/screens/home/home.dart';
import 'package:todoApp/screens/home/modules/slidingBackground.dart';
import 'package:todoApp/screens/home/note_tile.dart';
import 'package:todoApp/services/database.dart';
import 'package:todoApp/shared.dart/show_note_panel.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

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
          return Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.7,
                child: Divider(
                  height: 60.0,
                  color: Colors.white,
                ),
              ),
              Slidable(
                actionPane: SlidableDrawerActionPane(),
                actionExtentRatio: 0.25,
                child: NoteTile(note: notes[index]),               
                actions: <Widget>[
                  IconSlideAction(
                    caption: 'Edit',
                    color: Colors.yellow[900],
                    icon: Icons.edit,
                    onTap: () => {
                      NotePanel(note: notes[index], add: false, noteId: notes[index].id).showNewNotePanel(context)
                    },
                  ),
                  IconSlideAction(
                    caption: 'Share',
                    color: Colors.indigo,
                    icon: Icons.share,
                    onTap: () => {},
                  ),
                ],
                secondaryActions: <Widget>[
                  IconSlideAction(
                    caption: 'More',
                    color: Colors.black45,
                    icon: Icons.more_horiz,
                    onTap: () => {},
                  ),
                  IconSlideAction(
                    caption: 'Delete',
                    color: Colors.red,
                    icon: Icons.delete,
                    onTap: () => {
                      DatabaseService(uid: user.uid).removeNote(notes[index].id)
                    },
                  ),
                ],
              )
            //   Dismissible(
            //   key: Key(notes[index].id),
            //   background: slideRightBackground(),
            //   secondaryBackground: slideLeftBackground(),
            //   onDismissed: (direction) {
            //     DatabaseService(uid: user.uid).removeNote(notes[index].id);
            //     // notes.removeAt(index);
            //     // NotePanel(note: notes[index], add: false, noteId: notes[index].id).showNewNotePanel(context);
            //     // print('Edit');
            //   },
            //   child: NoteTile(note: notes[index])
            // ),
            ]
          );
        }
      );
    } catch(e) {
      return Container();
    }
   }
}