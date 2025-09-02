import 'package:day_task/utilitis/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key, this.onPress});
  final void Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: SizedBox(
        width: double.infinity,
        height: 60,
        child: ElevatedButton(
          onPressed: onPress,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.mainColor,
            foregroundColor: Colors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset("assets/images/logoutcurve.svg"),
              SizedBox(width: 10),
              Text(
                style: TextStyle(
                  fontSize: 18,
                  color: AppColors.backgroundColor,
                ),
                "Logout",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
