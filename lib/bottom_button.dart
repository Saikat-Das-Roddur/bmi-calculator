

import 'package:flutter/material.dart';

import 'constant.dart';

class BottomButton extends StatelessWidget {

  BottomButton({@required this.onTap, @required this.buttonText});
  final Function onTap;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(

        child: Center(
          child: Text(buttonText,
            style: largeButtonTextStyle,
            textAlign: TextAlign.center,),
        ),
        color: bottomCardColor,
        margin: EdgeInsets.only(top: 10),
        width: double.infinity,
        height: bottomContainerHeight,
      ),
    );
  }
}