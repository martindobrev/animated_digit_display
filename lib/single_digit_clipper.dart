import 'package:flutter/material.dart';

class SingleDigitClipper extends CustomClipper<Rect> {

  final Size _size;
  SingleDigitClipper(this._size); 

  @override
  Rect getClip(Size size) {
    return Rect.fromPoints(Offset.zero, Offset(this._size.width, this._size.height));
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) => false;
}