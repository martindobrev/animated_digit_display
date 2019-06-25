import 'package:animated_digit_display/single_digit_clipper.dart';
import 'package:flutter/material.dart';

class SingleDigit extends StatefulWidget {

  final TextStyle textStyle;
  final BoxDecoration boxDecoration;
  final int initialValue;

  SingleDigit({
    this.boxDecoration: const BoxDecoration(color: Colors.black), 
    this.textStyle: const TextStyle(color: Colors.grey, fontSize: 30),
    this.initialValue: 3
  });
  
  @override
  State<StatefulWidget> createState() {
    return new _SingleDigitState(textStyle, boxDecoration, initialValue);
  }
}

class _SingleDigitState extends State<SingleDigit> {
  
  _SingleDigitState(this._textStyle, this._boxDecoration, this._initialValue);

  final TextStyle _textStyle;
  final BoxDecoration _boxDecoration;
  final int _initialValue;

  @override
  Widget build(BuildContext context) {

    final Size singleDigitSize = _calculateDigitSize();

    return Container(
      decoration: _boxDecoration,
      child: SizedOverflowBox(
        alignment: Alignment.topCenter,
        size: singleDigitSize,
        child: ClipRect(
          clipper: SingleDigitClipper(singleDigitSize),
          child: Transform.translate(
            offset: Offset(0, -_initialValue.toDouble() * singleDigitSize.height),
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
          ),
        ),
      ),
    );
  }

  /// Calculates the size of a single digit based on the text style
  Size _calculateDigitSize() {
    final painter = TextPainter();
    painter.text = TextSpan(style: _textStyle, text: '0');
    painter.textDirection = TextDirection.ltr;
    painter.textAlign = TextAlign.left;
    painter.textScaleFactor = 1.0;
    painter.layout();
    return painter.size;
  }
}