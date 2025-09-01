import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({super.key, required this.text, required this.textColor});
  final String text;
  final Color textColor;
  @override
  Widget build(BuildContext context) {
    return Text(
     text,
      style: TextStyle(
        fontFamily: "PilatExtended",
        fontSize: 53,
        height: 1,
        color: textColor,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
