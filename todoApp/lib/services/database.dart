import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todoApp/models/note.dart';

class DatabaseService {

  final String uid;
  DatabaseService( {this.uid} );

  // instance of Cloud Firestore
  final firestoreInstance = FirebaseFirestore.instance;

  // collection reference for User
  final CollectionReference userCollection = FirebaseFirestore.instance.collection('users'); 

  // collection reference for notes of user
  // final CollectionReference notesCollection = FirebaseFirestore.instance.collection('users').doc(uid).collection('notes');

  // list of notes form snapshot
  List<Note> _noteFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Note(
        title: doc.data()['title'],
        mainPart: doc.data()['mainPart'],
        finished: doc.data()['finished'],
        id: doc.id,
      );
    }).toList();
  }

  // get notes (notfinished) stream
  Stream<List<Note>> get notes {
    return userCollection.doc(uid).collection('notes').where('finished', isEqualTo: false).snapshots().map((snapshot) {
      return _noteFromSnapshot(snapshot);
    }); 
  }

  // add Note 
  Future addNote(Note note) async {
    return await userCollection.doc(uid).collection('notes').add({
      'title': note.title,
      'mainPart': note.mainPart,
      'finished': false,
    });
  }

  // remove Note
  Future removeNote(String noteId) async {
    return await userCollection.doc(uid).collection('notes').doc(noteId).delete().then((_) {
      print('success!');
    });
  }

  // edite Note
  Future editNote(Note note, String noteId) async {
    Map<String, dynamic> data = {};
    if(note.title != null && note.mainPart != null){
      data['title'] = note.title;
      data['mainPart'] = note.mainPart;
    } else if(note.title != null && note.mainPart == null) {
      data['title'] = note.title;
    } else if(note.title == null && note.mainPart != null) {
      data['mainPart'] = note.mainPart;
    }
    
    if(note.finished != null) {
      data['finished'] = note.finished;
    }

    return await userCollection.doc(uid).collection('notes').doc(noteId).update(data);
  }
}