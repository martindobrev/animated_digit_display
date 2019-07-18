import 'package:flutter/material.dart';

class SingleDigit extends StatefulWidget {
  @override
  _SingleDigitState createState() => _SingleDigitState();
}

class _SingleDigitState extends State<SingleDigit> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        for (var i = 0; i < 10; i++)
          Text(i.toString())
      ],
    );
  }
}