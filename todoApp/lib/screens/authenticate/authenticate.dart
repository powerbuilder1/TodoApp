import 'package:flutter/material.dart';
import 'package:todoApp/screens/authenticate/register.dart';
import 'package:todoApp/screens/authenticate/sign_in.dart';


class Authenticate extends StatefulWidget {

  bool showSignIn;
  Authenticate( {this.showSignIn} );

  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  void toggleView() {
    setState(() {
      widget.showSignIn = !widget.showSignIn;
    }); 
  }

  @override
  Widget build(BuildContext context) {
    if(widget.showSignIn == true) {
      return SignIn(toggleView: toggleView);
    } else {
      return Register(toggleView: toggleView);
    }
  }
}