import 'package:day_task/utilitis/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomSquare extends StatelessWidget {
  const CustomSquare({super.key, required this.icon, this.onPress});
  final String icon;
  final void Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(color: AppColors.mainColor),
        child: Center(
          child: SvgPicture.asset(
            icon,
            width: 28,
            height: 28,
            fit: BoxFit.contain,
            color: AppColors.backgroundColor,
          ),
        ),
      ),
    );
  }
}
