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

    final Size digitSize = _getSingleDigitSize();
    final value = 3; 

    return Container(
      decoration: _boxDecoration,
      child: ClipRect(
        clipper: CustomDigitClipper(digitSize),
          child: Transform.translate(
          offset: Offset(0, - value * digitSize.height),
          child: Column(
            children: <Widget>[
              for (var i = 0; i < 10; i++)
                Text(i.toString(), style: _textStyle)   // ADD STYLE TO THE TEXT 
            ],
          ),
        ),
      ),
    );
  }

  ///
  /// Calculates the size of a single digit based on the current text style
  ///
  _getSingleDigitSize() {
    final painter = TextPainter();
    painter.text = TextSpan(style: _textStyle, text: '0');
    painter.textDirection = TextDirection.ltr;
    painter.textAlign = TextAlign.left;
    painter.textScaleFactor = 1.0;
    painter.layout();
    return painter.size;
  }
}

class CustomDigitClipper extends CustomClipper<Rect> {
  CustomDigitClipper(this.digitSize);
  final Size digitSize;

  @override
  Rect getClip(Size size) {
    return Rect.fromPoints(
        Offset.zero, Offset(digitSize.width, digitSize.height));
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return false;
  }
}