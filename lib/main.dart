import 'package:animated_digit_display/multiple_digit_counter.dart';
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
    final digitWidget = MultipleDigitCounter(
        10,
        false,
        const TextStyle(color: Colors.grey, fontSize: 30),
        253,
        const BoxDecoration(color: Colors.black));
    return ChangeNotifierProvider(
      builder: (_) => SliderValueProvider(),
      child: Scaffold(
          appBar: AppBar(title: Text('Digit Display Demo')),
          body: Center(
              child: Column(
            children: <Widget>[
              digitWidget,
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
                          digitWidget.state.value = (newValue.toInt());
                        }
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
