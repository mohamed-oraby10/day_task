import 'package:day_task/constants.dart';
import 'package:flutter/material.dart';

class CustomTaskDateAndTime extends StatelessWidget {
  const CustomTaskDateAndTime({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 140,
      color: kFillTextFormColor,
      child: Center(
        child: Text(text, style: TextStyle(color: Colors.white, fontSize: 18)),
      ),
    );
  }
}
