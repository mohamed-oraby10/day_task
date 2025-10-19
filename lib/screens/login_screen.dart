import 'package:day_task/constants.dart';
import 'package:day_task/provider/user_provider.dart';
import 'package:day_task/utilitis/app_routes.dart';
import 'package:day_task/widgets/continue.dart';
import 'package:day_task/widgets/main_button.dart';
import 'package:day_task/helper/snak_bar.dart';
import 'package:day_task/widgets/text_input.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? email, password;
  GlobalKey<FormState> formKey = GlobalKey();
  bool inAsyncCall = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: inAsyncCall,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 45.h, horizontal: 16.w),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
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
                    'Welcome Back!',
                    style: TextStyle(
                      fontSize: 26.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 15.h),

                  Text(
                    'Email Address',
                    style: TextStyle(color: kLabelTextColor, fontSize: 18.sp),
                  ),
                  SizedBox(height: 10.h),
                  TextInput(
                    hint: 'Enter your Email',
                    prefixIcon: Icons.email,
                    onChanged: (value) {
                      email = value;
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
                    onChanged: (value) {
                      password = value;
                    },
                    isPassword: true,
                  ),
                  Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: kLabelTextColor,
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 25.h),
                  MainButton(
                    textButton: 'Log In',
                    onPress: () async {
                      if (formKey.currentState!.validate()) {
                        inAsyncCall = true;
                        setState(() {});
                        try {
                          await loginUser();

                          final userProvider = Provider.of<UserProvider>(
                            context,
                            listen: false,
                          );
                          final currentUser =
                              FirebaseAuth.instance.currentUser!;
                          userProvider.clearUser();
                          userProvider
                              .saveUserData(
                                currentUser.displayName ?? "",
                                image: currentUser.photoURL,
                              )
                              .then((_) {
                                userProvider
                                    .listenToUser(currentUser.uid)
                                    .then(
                                      (_) => Navigator.pushNamedAndRemoveUntil(
                                        context,
                                        AppRoutes.homeRoute,
                                        (route) => false,
                                      ),
                                    );
                              });

                          showSnakBar(context, 'You login successfully');
                        } on FirebaseAuthException catch (e) {
                          inAsyncCall = false;
                          setState(() {});

                          if (e.code == 'invalid-credential') {
                            showSnakBar(
                              context,
                              'Wrong password provided for that user or No user found for that email. ',
                            );
                          } else {
                            showSnakBar(
                              context,
                              'Login failed. Please try again.',
                            );
                          }
                        }
                      }
                    },
                  ),

                  const Continue(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> loginUser() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }
}
