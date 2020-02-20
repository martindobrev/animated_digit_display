import 'package:flutter/material.dart';
import 'single_digit.dart';

class MultipleDigitCounter extends StatefulWidget {
  
  int initialValue;
  int numberOfDigits;
  bool expandable;
  final TextStyle textStyle;
  final BoxDecoration boxDecoration;

  _MultipleDigitCounterState _state;

  /// state has to be accessible so that the value is accessible from the parent widget
  _MultipleDigitCounterState get state => _state;

  MultipleDigitCounter(this.numberOfDigits, this.expandable, this.textStyle, this.initialValue, this.boxDecoration);

  @override
  _MultipleDigitCounterState createState() {
    this._state = _MultipleDigitCounterState(this.numberOfDigits, this.expandable, this.initialValue, this.textStyle, this.boxDecoration);
    return _state;
  } 
    
}

class _MultipleDigitCounterState extends State<MultipleDigitCounter> {

  int numberOfDigits;
  bool expandable;
  int _value;
  final TextStyle _textStyle;
  final BoxDecoration _boxDecoration;

  List<SingleDigit> animatedDigits = [];

  String _oldValue;
  String _newValue;

  int get value => _value;

  set value(int newValue) {

    _oldValue = value.toString();
    while (_oldValue.length < numberOfDigits) {
      _oldValue = '0$_oldValue';
    }

    _value = newValue;

    _newValue = newValue.toString();
    while (_newValue.length < numberOfDigits) {
      _newValue = '0$_newValue';
    } 

    setState(() {

      for (var i = 0; i < numberOfDigits; i++) {
        if (_oldValue[i] != _newValue[i]) {
          animatedDigits[i].setValue(int.parse(_newValue[i]));
        }
      }

    });
  }

  String getValueAsString() {
    String val = _value.toString();
    while (val.length < numberOfDigits) {
      val = '0$val';
    }
    return val;
  }

  _MultipleDigitCounterState(this.numberOfDigits, this.expandable, this._value, this._textStyle, this._boxDecoration);

  @override
  Widget build(BuildContext context) {
    if (animatedDigits.isEmpty) {
      String newValue = getValueAsString();

      for (var i = 0; i  < newValue.length; i++) {
        var initialDigit = 0;
        if (_oldValue != null && _oldValue.length > i) {
          initialDigit = int.parse(_oldValue[i]);
        }         
        animatedDigits.add(SingleDigit(initialValue: initialDigit));
      }
    }
    
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      
      children: animatedDigits
    );
    
  }
}