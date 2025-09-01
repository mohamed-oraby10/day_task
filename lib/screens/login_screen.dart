import 'package:day_task/utilitis/app_colors.dart';
import 'package:day_task/utilitis/app_routes.dart';
import 'package:day_task/widgets/continue.dart';
import 'package:day_task/widgets/fields.dart';
import 'package:day_task/widgets/main_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SvgPicture.asset(
                'assets/images/Group 5.svg',
                height: 90,
                width: double.infinity,
              ),
              const SizedBox(height: 30),
              const Fields(),
              Align(
                alignment: AlignmentDirectional.centerEnd,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(
                      color: AppColors.labelTextColor,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 25),
              MainButton(
                textButton: 'Log In',
                onPress: () {
                  Navigator.pushNamed(context, AppRoutes.homeRoute);
                },
              ),
              const SizedBox(height: 20),
              const Continue(),
            ],
          ),
        ),
      ),
    );
  }
}
