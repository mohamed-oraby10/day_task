import 'package:day_task/utilitis/app_colors.dart';
import 'package:day_task/utilitis/app_routes.dart';
import 'package:day_task/widgets/continue.dart';
import 'package:day_task/widgets/fields.dart';
import 'package:day_task/widgets/main_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String? email;
  String? password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              children: [
                SizedBox(height: 40),
                SvgPicture.asset(
                  'assets/images/Group 5.svg',
                  height: 90,
                  width: double.infinity,
                ),
                const SizedBox(height: 30),
                const Fields(isRegisterScreen: true),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Checkbox(
                      value: false,
                      onChanged: (value) {},
                      checkColor: AppColors.backgroundColor,
                      fillColor: const WidgetStatePropertyAll(
                        AppColors.mainColor,
                      ),
                    ),
                    const Expanded(
                      child: Text(
                        'I have read & agreed to DayTask Privacy Policy, Terms & Condition',
                        style: TextStyle(
                          color: AppColors.labelTextColor,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                MainButton(
                  textButton: 'Sign Up',
                  onPress: ()  {
                    // var user = await FirebaseAuth.instance
                    //     .createUserWithEmailAndPassword(
                    //       email: email,
                    //       password: password,
                    //     );
                    Navigator.pushNamed(context, AppRoutes.homeRoute);
                  },
                ),
                const SizedBox(height: 20),
                const Continue(isRegisterScreen: true),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
