import 'package:flutter/material.dart';
import 'package:todoApp/models/global.dart';
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

    final mq = MediaQuery.of(context).size;  

    return loading ? Loading() : Scaffold(
        body: Stack(
          children: [
            Container(
              color: darkGreyColor,
              child: Container(
                padding: EdgeInsets.only(bottom: mq.height * 0.04),
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FlatButton(
                      child: Row(
                        children: [
                          Text(
                            'NEW',
                            style: TextStyle(
                                color: Colors.white,
                              )
                            ),
                          SizedBox(width: mq.width * 0.02),
                          Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 30.0,
                            ),
                        ],
                      ),
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
                          Navigator.pop(context);
                        }
                      } 
                    ),
                  ],
                ),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                height: mq.height * 0.85,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    // Foto von Karolina Grabowska von Pexelsy
                    image: AssetImage('assets/register.jpg'),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(60.0),
                    bottomRight: Radius.circular(60.0)
                  )
                ),
                child: Container(
                  child: Column(
                    children: [
                      SizedBox(height: mq.height * 0.04),
                      Container(
                        height: mq.height * 0.15,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/logo.png'),
                            fit: BoxFit.contain,
                          )
                        ),
                      ),
                      SizedBox(height: mq.height * 0.1),
                      Text(
                        'Register',
                        style: TextStyle(
                          fontSize: 40.0,
                          color: Colors.white,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      Text(
                        'to a minimalistic note app.',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white70,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      SizedBox(height: mq.height * 0.04,),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              SizedBox(height: 20.0),
                              TextFormField(
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                                decoration: InputDecoration(
                                  labelText: 'Enter your Email',
                                  labelStyle: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                validator: (val) => val.isEmpty ? 'Enter an email' : null,
                                onChanged: (val) {
                                  setState(() => email = val); 
                                }
                              ),
                              SizedBox(height: 20.0),
                              TextFormField(
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                                obscureText: true,
                                decoration: InputDecoration(
                                  labelText: 'Enter your Password',
                                  labelStyle: TextStyle(
                                    color: Colors.white,
                                  ),
                                  alignLabelWithHint: true,
                                ),
                                validator: (val) => val.length < 6 ? 'Password min. 6 chars' : null, 
                                onChanged: (val) {
                                  setState(() => password = val);
                                }
                              ),
                            ],
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already have an account?',
                            style: TextStyle(
                              color: Colors.white70
                            ),
                            ),
                          FlatButton(
                            child: Row(
                              children: [
                                Text(
                                  'Sign in now',
                                  style: TextStyle(
                                      color: Colors.white,
                                  )
                                  ),
                                Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                            onPressed: () {
                              // Navigator.push(context, MaterialPageRoute(builder: (context) => Authenticate(showSignIn: false)));
                              widget.toggleView();
                            },
                          ),
                        ],
                      )
                   ],
                  ),
                ),
              ),
            ),
          ],
        ),
    );
  }
}
