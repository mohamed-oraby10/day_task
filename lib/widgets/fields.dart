import 'package:day_task/utilitis/app_colors.dart';
import 'package:flutter/material.dart';
import 'text_input.dart';

class Fields extends StatelessWidget {
  final bool isRegisterScreen;
  const Fields({super.key, this.isRegisterScreen = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          isRegisterScreen ? 'Create your Account' : 'Welcome Back!',
          style: const TextStyle(fontSize: 28, color: Colors.white),
        ),
        const SizedBox(height: 15),
        if (isRegisterScreen)
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Text(
                'Full Name',
                style: TextStyle(color: AppColors.labelTextColor, fontSize: 18),
              ),
              SizedBox(height: 10),
              TextInput(hint: 'Enter your Full Name', prefixIcon: Icons.person),
            ],
          ),
        const SizedBox(height: 25),
        const Text(
          'Email Address',
          style: TextStyle(color: AppColors.labelTextColor, fontSize: 18),
        ),
        const SizedBox(height: 10),
        const TextInput(hint: 'Enter your Email', prefixIcon: Icons.email,),
        const SizedBox(height: 25),
        const Text(
          'Password',
          style: TextStyle(color: AppColors.labelTextColor, fontSize: 18),
        ),
        const SizedBox(height: 10),
        const TextInput(
          hint: 'Enter your Password',
          prefixIcon: Icons.lock,

          isPassword: true,
        ),
      ],
    );
  }
}
