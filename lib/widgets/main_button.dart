import 'package:day_task/utilitis/app_colors.dart';
import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final String textButton;
  final VoidCallback onPress;
  final Color? backColor;
  final Color? textColor;
  final BorderSide? border;

  const MainButton({
    super.key,
    required this.textButton,
    required this.onPress,
    this.backColor = AppColors.mainColor,
    this.textColor = Colors.black,
    this.border,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: ElevatedButton(
        onPressed: onPress,
        style: ElevatedButton.styleFrom(
          backgroundColor: backColor,
          foregroundColor: textColor,
          side: border,
        ),
        child: Text(
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          textButton,
        ),
      ),
    );
  }
}
