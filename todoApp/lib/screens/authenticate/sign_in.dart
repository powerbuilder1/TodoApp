import 'package:flutter/material.dart';
import 'package:todoApp/models/global.dart';
import 'package:todoApp/services/auth.dart';
import 'package:todoApp/shared/loading.dart';

class SignIn extends StatefulWidget {

Function toggleView;
SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final _formKey = GlobalKey<FormState>();
  final _auth = AuthService();

  String email = "";
  String password = "";

  bool loading = false;

  @override
  Widget build(BuildContext context) {

    final mq  = MediaQuery.of(context).size;

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
                            'LOG IN',
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
                      onPressed: () async {
                          if(_formKey.currentState.validate()){
                            setState(() {
                              loading = true;
                            });
                            dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                            Navigator.pop(context);
                            if(result == null) {
                              setState(() {
                                loading = false;
                              });
                            }
                          }
                        }
                    ),
                    SizedBox(width: mq.width * 0.15),
                    FlatButton(
                      child: Row(
                        children: [
                          Text(
                            'NEW',
                            style: TextStyle(
                                color: Colors.white,
                              )
                            ),
                          Icon(
                            Icons.add,
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
                ),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                height: mq.height * 0.85,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    // Bild von fotografierende auf Pixabay
                    image: AssetImage('assets/login1.jpg'),
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
                        'Login',
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
                      SizedBox(height: mq.height * 0.08,),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              SizedBox(height: 20.0),
                              TextFormField(
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
                            'New to cophee-note?',
                            style: TextStyle(
                              color: Colors.white70
                            ),
                            ),
                          FlatButton(
                            child: Row(
                              children: [
                                Text(
                                  'Sign up now',
                                  style: TextStyle(
                                      color: Colors.white,
                                  )
                                  ),
                                Icon(
                                  Icons.add,
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