import 'package:animated_digit_display/single_digit.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animated Digit Display Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DigitDisplayDemo()
    );
  }
}

class DigitDisplayDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Digit Display Demo')),
      body: Center(
        child: SingleDigit(initialValue: 3))
    );
  }
}
