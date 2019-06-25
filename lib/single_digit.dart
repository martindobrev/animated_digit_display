import 'package:animated_digit_display/single_digit_clipper.dart';
import 'package:flutter/material.dart';

class SingleDigit extends StatefulWidget {

  final TextStyle textStyle;
  final BoxDecoration boxDecoration;
  final int initialValue;

  _SingleDigitState _state;

  int get value {
    if (_state == null) {
      return initialValue;
    }
    return _state.value;
  }

  set value(int newValue) {
    if (_state != null) {
      _state.value = newValue;
    }
  }

  SingleDigit({
    this.boxDecoration: const BoxDecoration(color: Colors.black), 
    this.textStyle: const TextStyle(color: Colors.grey, fontSize: 30),
    this.initialValue: 0
  });
  
  @override
  State<StatefulWidget> createState() {
    _state = new _SingleDigitState(textStyle, boxDecoration, 0, initialValue);
    return _state;
  }
}

class _SingleDigitState extends State<SingleDigit> with TickerProviderStateMixin {

  Animation<double> animation;
  AnimationController controller;
  
  _SingleDigitState(this._textStyle, this._boxDecoration, this._previousValue, this._currentValue);

  final TextStyle _textStyle;
  final BoxDecoration _boxDecoration;
  int _previousValue;
  int _currentValue;

  int get value => _currentValue;

  set value(int newValue) {
    if (newValue != this._currentValue) {
      this._previousValue = this._currentValue;
      this._currentValue = newValue;
      controller.dispose();
      _initializeAnimationController();
    }
  }

  @override
  void initState() {
    super.initState();
    _initializeAnimationController();
  }

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
            offset: Offset(0, - animation.value * singleDigitSize.height),
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

  _initializeAnimationController() {
    controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this
    );
    
    animation = Tween<double>(
      begin: _previousValue.toDouble(),
      end: _currentValue.toDouble()
    ).animate(controller)
      ..addListener(() {
        setState(() {});
    });
    
    controller.forward();
  }
}