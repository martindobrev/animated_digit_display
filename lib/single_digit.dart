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
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text('0', style: _textStyle),
          Text('1', style: _textStyle),
          Text('2', style: _textStyle),
          Text('3', style: _textStyle),
          Text('4', style: _textStyle),
          Text('5', style: _textStyle),
          Text('6', style: _textStyle),
          Text('7', style: _textStyle),
          Text('8', style: _textStyle),
          Text('9', style: _textStyle),
        ],
      ),
    );
  }

}