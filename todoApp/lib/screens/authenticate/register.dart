import 'package:flutter/material.dart';
import 'package:todoApp/services/auth.dart';
import 'package:todoApp/shared/loading.dart';

class Register extends StatefulWidget {

Function toggleView;
Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final _formKey = GlobalKey<FormState>();
  final _auth = AuthService();

  String email = "";
  String password = "";
  String error = '';

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text('Register'),
        actions: [
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Sign in'),
            onPressed: () => widget.toggleView(),
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 20.0),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Enter your Email',
                ),
                validator: (val) => val.isEmpty ? 'Enter an email' : null,
                onChanged: (val) {
                   setState(() => email = val); 
                }
              ),
              SizedBox(height: 20.0),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Enter your Password',
                ),
                validator: (val) => val.length < 6 ? 'Password min. 6 chars' : null, 
                onChanged: (val) {
                  setState(() => password = val);
                }
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                child: Text('Register'),
                onPressed: () async {
                  if(_formKey.currentState.validate()){
                    setState(() {
                      loading = true;
                    });
                    dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                    if(result == null) {
                      setState(() {
                        error = 'please supply a valid email';
                        loading = false;
                      });
                    }
                  }
                } 
              ),
              SizedBox(height: 12.0),
              Text(
                error,
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 14.0,
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}