
import 'package:bmi_calculator/constant.dart';
import 'package:flutter/material.dart';

class IconContent extends StatelessWidget {

  IconContent({@required this.icons, @required this.text});
  final IconData icons;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icons,size: 80,),
        SizedBox(height: 15,),
        Text(text,
          style: labelStyle,)
      ],
    );
  }
}