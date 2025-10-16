import 'package:day_task/constants.dart';
import 'package:day_task/widgets/custom_text.dart';
import 'package:day_task/utilitis/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../widgets/main_button.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              SvgPicture.asset(
                'assets/images/Group 5.svg',
                height: 62.h,
                width: double.infinity,
              ),
              SizedBox(height: 20.h),
              Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.h),
                  child: Container(
                    color: Colors.white,
                    child: Image.asset(
                      'assets/images/pana.png',
                      height: 330.h,
                      width: double.infinity,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: "Manage \nyour \nTask with",
                      textColor: Colors.white,
                    ),
                    CustomText(text: "DayTask", textColor: kMainColor),
                  ],
                ),
              ),

              SizedBox(height: 40.h),
              MainButton(
                textButton: 'Let\'s Start',
                onPress: () {
                  Navigator.pushNamed(context, AppRoutes.homeRoute);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
