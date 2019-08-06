import 'package:animated_digit_display/single_digit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Animated Digit Display Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: DigitDisplayDemo());
  }
}

class DigitDisplayDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    final singleDigitWidget = SingleDigit();
    return ChangeNotifierProvider(
      builder: (_) => SliderValueProvider(),
      child: Scaffold(
          appBar: AppBar(title: Text('Digit Display Demo')),
          body: Center(
              child: Column(
            children: <Widget>[
              singleDigitWidget,
              Consumer<SliderValueProvider>(
                builder: (BuildContext _, SliderValueProvider sliderValueProvider, Widget __) {
                  return Slider(
                      value: sliderValueProvider.value.toDouble(),
                      min: 0,
                      max: 9,
                      onChanged: (newValue) {
                        sliderValueProvider.setValue(newValue.toInt());
                        singleDigitWidget.setValue(newValue.toInt());
                      });
                },
              )
            ],
          ))),
    );
  }
}

class SliderValueProvider with ChangeNotifier {
  int _value = 0;
  int get value => _value;

  void setValue(int newValue) {
    _value = newValue;
    notifyListeners();
  }
}
