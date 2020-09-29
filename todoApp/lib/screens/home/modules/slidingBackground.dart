import 'package:flutter/material.dart';
import 'package:todoApp/models/global.dart';

Widget slideRightBackground() {
  return Container(
    color: Colors.green,
    child: Align(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(width: 20),
          Icon(
            Icons.edit,
            color: Colors.white,
          ),
          Text(
            ' Edit',
            style: slideText,
            textAlign: TextAlign.left,
          ),
        ],
      ),
      alignment: Alignment.centerLeft,
    )
  );
}

Widget slideLeftBackground() {
  return Container(
    color: Colors.red,
    child: Align(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Icon(
            Icons.delete,
            color: Colors.white,
          ),
          Text(
            ' Delete',
            style: slideText,
            textAlign: TextAlign.right,
          ),
          SizedBox(width: 20.0)
        ],
      ),
      alignment: Alignment.centerRight,
    )
  );
}