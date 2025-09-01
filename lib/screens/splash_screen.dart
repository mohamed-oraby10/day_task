import 'package:day_task/widgets/custom_text.dart';
import 'package:day_task/utilitis/app_colors.dart';
import 'package:day_task/utilitis/app_routes.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../widgets/main_button.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            SizedBox(height: 20),
            SvgPicture.asset(
              'assets/images/Group 5.svg',
              height: 70,
              width: double.infinity,
            ),
            SizedBox(height: 20),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Container(
                  color: Colors.white,
                  child: Image.asset(
                    'assets/images/pana.png',
                    height: 330,
                    width: double.infinity,
                  ),
                ),
              ),
            ),

            CustomText(
              text: "Manage \nyour \nTasks with",
              textColor: Colors.white,
            ),
            CustomText(text: "DayTask", textColor: AppColors.mainColor),

            SizedBox(height: 40),
            MainButton(
              textButton: 'Let\'s Start',
              onPress: () {
                Navigator.pushNamed(context, AppRoutes.loginRoute);
              },
            ),
          ],
        ),
      ),
    );
  }
}
