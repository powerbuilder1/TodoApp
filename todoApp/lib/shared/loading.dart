import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:todoApp/models/global.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: darkGreyColor,
      child: Center(
        child: SpinKitChasingDots(
          color: redColor,
          size: 50.0,
        )
      )
    );
  }
}