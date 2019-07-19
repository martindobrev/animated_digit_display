import 'package:flutter/material.dart';

class SingleDigit extends StatefulWidget {

  final TextStyle textStyle;
  final BoxDecoration boxDecoration;

  SingleDigit({ 
    this.boxDecoration: const BoxDecoration(color: Colors.black), 
    this.textStyle: const TextStyle(color: Colors.grey, fontSize: 30)
  });
  
  @override
  State<StatefulWidget> createState() {
    return new _SingleDigitState(textStyle, boxDecoration);
  }
}

class _SingleDigitState extends State<SingleDigit> {

  _SingleDigitState(this._textStyle, this._boxDecoration);

  final TextStyle _textStyle;
  final BoxDecoration _boxDecoration;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: _boxDecoration,
      child: Column(
        children: <Widget>[
          for (var i = 0; i < 10; i++)
            Text(i.toString(), style: _textStyle)   // ADD STYLE TO THE TEXT 
        ],
      ),
    );
  }
}