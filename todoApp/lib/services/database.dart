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
        id: doc.id,
      );
    }).toList();
  }

  // get notes stream
  Stream<List<Note>> get notes {
    return userCollection.doc(uid).collection('notes').snapshots().map((snapshot) {
      return _noteFromSnapshot(snapshot);
    }); 
  }

  // add Note 
  Future addNote(Note note) async {
    return userCollection.doc(uid).collection('notes').add({
      'title': note.title,
      'mainPart': note.mainPart,
      'finished': note.finished,
    });
  }

  // remove Note
  Future removeNote(String id) async {
    return userCollection.doc(uid).collection('notes').doc(id).delete().then((_) {
      print('success!');
    });
  }

  // edite Note
  Future editNote(Note note, String userId) async {
    return userCollection.doc(userId).collection('notes').doc(note.id).set({
      'title': note.title,
      'mainPart': note.mainPart,
    }, SetOptions(merge: true));
  }
}