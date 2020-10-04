import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoApp/models/user.dart';
import 'package:todoApp/screens/authenticate/authenticate.dart';
import 'package:todoApp/screens/home/home.dart';
import 'package:todoApp/screens/index/index.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<CustomUser>(context);

    if(user != null) {
      return Home();
    } else {
      return Index();
      // return Authenticate(showSignIn: true);
    }
  }
} 