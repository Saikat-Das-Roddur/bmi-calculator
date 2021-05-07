import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'constant.dart';
import 'icon_content.dart';

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
                      thumbShape: RoundSliderThumbShape(
                        enabledThumbRadius: 15
                      ),
                      overlayShape: RoundSliderOverlayShape(
                        overlayRadius: 30
                      )
                    ),
                    child: Slider(value: height.toDouble(),
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
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: cardColor,
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: bottomCardColor,
            margin: EdgeInsets.only(top: 10),
            width: double.infinity,
            height: bottomContainerHeight,
          )
        ],
      ),
    );
  }
}
