import 'package:flutter/material.dart';
import 'package:todoApp/models/global.dart';
import 'package:todoApp/screens/authenticate/authenticate.dart';

class Index extends StatefulWidget {
  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {

  bool showLogin = false;
  bool showRegister = false;

  @override
  Widget build(BuildContext context) {


    final mq = MediaQuery.of(context).size;
   
      return Scaffold(
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
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Authenticate(showSignIn: true)));
                      },
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
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Authenticate(showSignIn: false)));
                      },
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: mq.height * 0.85,
              decoration: BoxDecoration(
                image: DecorationImage(
                  // Bild von fotografierende auf Pixabay
                  image: AssetImage('assets/index1.jpg'),
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
                      height: mq.height * 0.2,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/logo.png'),
                          fit: BoxFit.contain,
                        )
                      ),
                    ),
                    SizedBox(height: mq.height * 0.3),
                    Text(
                      'Welcome',
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
                    Text(
                      'LOG IN OR CREATE A NEW ACCOUNT',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white70,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    SizedBox(height: mq.height * 0.03),
                    Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.white70,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
  }
}