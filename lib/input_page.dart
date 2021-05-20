import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/result_page.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'bottom_button.dart';
import 'constant.dart';
import 'icon_content.dart';
import 'rounded_icon _button.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPagePageState createState() => _InputPagePageState();
}

class _InputPagePageState extends State<InputPage> {
  // Color maleCardColor = inactiveCardColor;
  // Color femaleCardColor = inactiveCardColor;
  Gender selectGender;
  int height = 120;
  int weight = 60;
  int age = 20;



  // void updateColor(Gender selectedGender) {
  //   if (selectedGender == Gender.male) {
  //     if (maleCardColor == inactiveCardColor) {
  //       maleCardColor = cardColor;
  //       femaleCardColor = inactiveCardColor;
  //     } else {
  //       maleCardColor = inactiveCardColor;
  //     }
  //   }
  //
  //   if (selectedGender == Gender.female) {
  //     if (maleCardColor == inactiveCardColor) {
  //       femaleCardColor = cardColor;
  //       maleCardColor = inactiveCardColor;
  //     } else {
  //       femaleCardColor = inactiveCardColor;
  //     }
  //   }
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("BMI Calculator"),
      ),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectGender = Gender.male;
                      });
                      //updateColor(Gender.male);
                    },
                    color: selectGender == Gender.male
                        ? cardColor
                        : inactiveCardColor,
                    cardChild: IconContent(
                      icons: FontAwesomeIcons.mars,
                      text: "Male",
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectGender = Gender.female;
                      });
                    },
                    color: selectGender == Gender.female
                        ? cardColor
                        : inactiveCardColor,
                    cardChild: IconContent(
                      icons: FontAwesomeIcons.venus,
                      text: "Female",
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              color: cardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Height",
                    style: labelStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: textStyle,
                      ),
                      Text(
                        "cm",
                        style: labelStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Color(0xff8d898),
                        overlayColor: Color(0x29eb1555),
                        thumbColor: bottomCardColor,
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30)),
                    child: Slider(
                        value: height.toDouble(),
                        min: 120,
                        max: 220,
                        // activeColor: bottomCardColor,
                        // inactiveColor: inactiveCardColor,
                        onChanged: (value) {
                          setState(() {
                            height = value.toInt();
                          });
                        }),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    color: cardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Weight",
                          style: labelStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: textStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(iconData: FontAwesomeIcons.plus,onPress: (){
                              setState(() {
                                weight++;
                              });
                            },),
                            SizedBox(width: 10,),
                            RoundIconButton(iconData: FontAwesomeIcons.minus,onPress:(){
                              setState(() {
                                weight--;
                              });
                            }),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: cardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Age",
                          style: labelStyle,
                        ),
                        Text(
                          age.toString(),
                          style: textStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(iconData: FontAwesomeIcons.plus,onPress: (){
                              setState(() {
                                age++;
                              });
                            },),
                            SizedBox(width: 10,),
                            RoundIconButton(iconData: FontAwesomeIcons.minus,onPress:(){
                              setState(() {
                                age--;
                              });
                            }),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(onTap: (){
            CalculatorBrain _calculatorBrain = CalculatorBrain(height: height, weight: weight);
            //final String interpretation = _calculatorBrain.getInterpretation();
            Navigator.push(context,
                MaterialPageRoute(builder:(context)=> Resultpage(
                    bmiResult: _calculatorBrain.calculateBMI(),
                  resultText: _calculatorBrain.getResult(),
                  interpretation: _calculatorBrain.getInterpretation(),
                )
                )
            );
          },buttonText: "calculate".toUpperCase(),)
        ],
      ),
    );
  }
}



