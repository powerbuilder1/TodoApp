import 'package:flutter/material.dart';
import 'package:todoApp/screens/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:todoApp/models/user.dart';
import 'package:provider/provider.dart';
import 'package:todoApp/services/auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<CustomUser>.value(
      value: AuthService().user, 
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}

