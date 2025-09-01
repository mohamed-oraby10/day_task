import 'package:day_task/utilitis/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.backgroundColor,
          foregroundColor: Colors.white,
          side: const BorderSide(color: Colors.white, width: 2),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset("assets/images/google.svg"),
            SizedBox(width: 10),
            Text(style: TextStyle(fontSize: 18), "Google"),
          ],
        ),
      ),
    );
  }
}
