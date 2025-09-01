import 'package:day_task/utilitis/app_colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    // required this.buttonColor,
    this.onPress,
  });
  final String text;
  // final Color buttonColor;
  final void Function()? onPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: 47,
        width: 175,
        decoration: BoxDecoration(color: AppColors.mainColor),
        child: Center(
          child: Text(
            text,
            style: TextStyle(color: Colors.black, fontSize: 17),
          ),
        ),
      ),
    );
    // ElevatedButton(

    //   style: ElevatedButton.styleFrom(
    //     minimumSize: const Size(150, 50),
    //     backgroundColor: AppColors.mainColor,
    //   ),
    //   onPressed:onPress,
    //   child:  Text(text, style: TextStyle(color: Colors.black,fontSize: 18)),
    // );
  }
}
