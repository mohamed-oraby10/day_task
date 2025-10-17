import 'package:day_task/constants.dart';
import 'package:day_task/service/register_service.dart';
import 'package:day_task/utilitis/app_routes.dart';
import 'package:day_task/widgets/continue.dart';
import 'package:day_task/widgets/main_button.dart';
import 'package:day_task/helper/snak_bar.dart';
import 'package:day_task/widgets/text_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String? email, password, name;
  GlobalKey<FormState> formkey = GlobalKey();
  bool inAsyncCall = false;
  bool check = false;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      progressIndicator: CircularProgressIndicator(color: kMainColor),
      inAsyncCall: inAsyncCall,
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(
            left: 16.w,
            right: 16.w,
            top: 45.h,
            bottom: 16.h,
          ),
          child: SingleChildScrollView(
            child: Form(
              key: formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: SvgPicture.asset(
                      'assets/images/Group 5.svg',
                      height: 92.h,
                      width: double.infinity,
                    ),
                  ),
                  SizedBox(height: 30.h),
                  Text(
                    'Create your account',
                    style: TextStyle(
                      fontSize: 26.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 15.h),

                  Text(
                    'Full Name',
                    style: TextStyle(color: kLabelTextColor, fontSize: 18.sp),
                  ),
                  SizedBox(height: 10.h),
                  TextInput(
                    hint: 'Enter your Full Name',
                    prefixIcon: Icons.person,
                    onChanged: (data) {
                      name = data;
                    },
                  ),
                  SizedBox(height: 25.h),
                  Text(
                    'Email Address',
                    style: TextStyle(color: kLabelTextColor, fontSize: 18.sp),
                  ),
                  SizedBox(height: 10.h),
                  TextInput(
                    hint: 'Enter your Email',
                    prefixIcon: Icons.email,
                    onChanged: (data) {
                      email = data;
                    },
                  ),
                  SizedBox(height: 25.h),
                  Text(
                    'Password',
                    style: TextStyle(color: kLabelTextColor, fontSize: 18.sp),
                  ),
                  SizedBox(height: 10.h),
                  TextInput(
                    hint: 'Enter your Password',
                    prefixIcon: Icons.lock,
                    onChanged: (data) {
                      password = data;
                    },
                    isPassword: true,
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Checkbox(
                          value: check,
                          onChanged: (value) {
                            check = value!;
                            setState(() {});
                          },

                          checkColor: kBackgroundColor,
                          fillColor: const WidgetStatePropertyAll(kMainColor),
                        ),
                        Expanded(
                          child: Text(
                            'I have read & agreed to DayTask Privacy Policy, Terms & Condition',
                            style: TextStyle(
                              color: kLabelTextColor,
                              fontSize: 14.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    child: MainButton(
                      textButton: 'Sign Up',
                      onPress: () async {
                        if (formkey.currentState!.validate() && check) {
                          inAsyncCall = true;
                          setState(() {});
                          try {
                            await registerUser(email: email, name: name!, password: password);

                            Navigator.pushNamed(context, AppRoutes.homeRoute);
                            showSnakBar(
                              context,
                              'Account created successfully',
                            );
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'weak-password') {
                              showSnakBar(
                                context,
                                'The password provided is too weak.',
                              );
                            } else if (e.code == 'email-already-in-use') {
                              showSnakBar(
                                context,
                                'The account already exists for that email.',
                              );
                            }
                          }
                          inAsyncCall = false;
                          setState(() {});
                        } else if (!check) {
                          showSnakBar(
                            context,
                            "You must agree to DayTask policy",
                          );
                        }
                      },
                    ),
                  ),
                  const Continue(isRegisterScreen: true),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}
