import 'package:animated_digit_display/single_digit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    final SingleDigit singleDigit = SingleDigit();
    return ChangeNotifierProvider.value(
      value: IntValueProvider(),
      child: Scaffold(
        appBar: AppBar(title: Text('Digit Display Demo')),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              singleDigit,
              Consumer<IntValueProvider>(
                builder: (context, intValueProvider, child) {
                  return Slider(
                    min: 0,
                    max: 9,
                    value: intValueProvider.value.toDouble(),
                    onChanged: (newValue) {
                      intValueProvider.value = newValue.toInt();
                      singleDigit.value = newValue.toInt();
                  });
                },
              )
            ],
          )
        )
      ),
    );
  }
}

/// Provider for a simple int value
/// 
/// Notifies listeners whenever the value changes
/// 
class IntValueProvider with ChangeNotifier {
  int _value = 0;
  int get value => _value;
  set value(int newValue) {
    if (newValue != _value) {
      _value = newValue;
      notifyListeners();
    }
  }
}