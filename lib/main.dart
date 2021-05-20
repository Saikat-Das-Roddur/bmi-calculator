import 'package:bmi_calculator/result_page.dart';
import 'package:flutter/material.dart';

import 'input_page.dart';

void main() {
  runApp(BMICalculator());
}

class BMICalculator extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0a0e21),
        scaffoldBackgroundColor: Color(0xFF0a0e21)
      ),
      home: InputPage(),
      initialRoute: '/',
      routes: {
        '/results':(context)=> Resultpage()
      },
    );
  }
}
