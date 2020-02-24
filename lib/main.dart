import 'dart:math';

import 'package:animated_digit_display/multiple_digit_counter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

/// global key to get to the counter's state
final counterKey = GlobalKey();

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

  final digitCounter = MultipleDigitCounter(
        10,
        false,
        const TextStyle(color: Colors.grey, fontSize: 30),
        253,
        const BoxDecoration(color: Colors.black), key: counterKey,);

    return MaterialApp(
        title: 'Animated Digit Display Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: DigitDisplayDemo(digitCounter));
  }
}

class DigitDisplayDemo extends StatelessWidget {

  final MultipleDigitCounter digitCounter;

  DigitDisplayDemo(this.digitCounter);

  @override
  Widget build(BuildContext context) {
    final random = new Random();
    return ChangeNotifierProvider(
      builder: (_) => SliderValueProvider(),
      child: Scaffold(
          appBar: AppBar(title: Text('Digit Display Demo')),
          body: Center(
              child: Column(
            children: <Widget>[
              this.digitCounter,
              Consumer<SliderValueProvider>(
                builder: (BuildContext _,
                    SliderValueProvider sliderValueProvider, Widget __) {
                  return Slider(
                      value: sliderValueProvider.value.toDouble(),
                      min: 0,
                      max: 2000,
                      onChanged: (newValue) {
                        if (newValue.toInt() !=
                            sliderValueProvider.value.toInt()) {
                          sliderValueProvider.setValue(newValue.toInt());
                          (counterKey.currentState as MultipleDigitCounterState).value = newValue.toInt();
                            }
                      });
                }
              ), RaisedButton(onPressed: () => (counterKey.currentState as MultipleDigitCounterState).value = random.nextInt(50000), child: Text('randomize'))
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
