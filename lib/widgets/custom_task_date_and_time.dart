import 'package:day_task/utilitis/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTaskDateAndTime extends StatelessWidget {
  const CustomTaskDateAndTime({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 140,
      color: AppColors.fillTextFormColor,
      child: Center(
        child: Text(text, style: TextStyle(color: Colors.white, fontSize: 18)),
      ),
    );
  }
}
