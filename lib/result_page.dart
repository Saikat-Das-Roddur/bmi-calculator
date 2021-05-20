import 'package:bmi_calculator/bottom_button.dart';
import 'package:bmi_calculator/constant.dart';
import 'package:bmi_calculator/input_page.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/material.dart';


class Resultpage extends StatelessWidget {
  Resultpage({@required this.resultText,@required this.bmiResult,@required this.interpretation,});
  final String interpretation;
  final String resultText;
  final String bmiResult;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI CALCULATOR"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.all(15),
                alignment: Alignment.bottomLeft,
                child: Text(
                  "Your Result",
                  style: titleTextStyle,
                ),
              )),
          Expanded(
              flex: 5,
              child: ReusableCard(
                color: cardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      resultText,
                      style: resultTextStyle,
                    ),
                    Text(
                      bmiResult,
                      style: bmiTextStyle,
                    ),
                    Text(
                      interpretation,
                      textAlign: TextAlign.center,
                      style: bodyTextStyle,
                    ),
                  ],
                ),
              )),
          BottomButton(onTap: (){
            Navigator.pop(context);
          }, buttonText: "re-calculate".toUpperCase())
        ],
      ),
    );
  }
}
