import 'package:firebase_auth/firebase_auth.dart';
import 'package:todoApp/models/user.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<CustomUser> get user {
    return _auth.authStateChanges().map((User firebaseUser) => _customUserFromFirebaseUser(firebaseUser));
  }

  // create user object form FirebaseUser (User)
  CustomUser _customUserFromFirebaseUser(User firebaseUser) {
    return firebaseUser != null ? CustomUser(uid: firebaseUser.uid) : null;
  }

  // register with email an password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User firebaseUser = result.user;
      return _customUserFromFirebaseUser(firebaseUser);
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  // signIn with email an password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User user = result.user;
      return user;
    } catch(e) {
      // print(e.toString());
      return null;
    }
  }

  // signOut
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

}