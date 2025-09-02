import 'package:day_task/utilitis/app_colors.dart';
import 'package:day_task/utilitis/app_routes.dart';
import 'package:day_task/widgets/continue.dart';
import 'package:day_task/widgets/main_button.dart';
import 'package:day_task/widgets/snak_bar.dart';
import 'package:day_task/widgets/text_input.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

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
    return ModalProgressHUD(
      inAsyncCall: inAsyncCall,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 16),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: SvgPicture.asset(
                      'assets/images/Group 5.svg',
                      height: 90,
                      width: double.infinity,
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    'Email Address',
                    style: TextStyle(
                      color: AppColors.labelTextColor,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextInput(
                    hint: 'Enter your Email',
                    prefixIcon: Icons.email,
                    onChanged: (value) {
                      email = value;
                    },
                  ),
                  const SizedBox(height: 25),
                  const Text(
                    'Password',
                    style: TextStyle(
                      color: AppColors.labelTextColor,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 10),
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
                    onPress: () async {
                      if (formKey.currentState!.validate()) {
                        inAsyncCall = true;
                        setState(() {
                          
                        });
                        try {
                          await loginUser();
                          showSnakBar(context, 'You login successfully');
                        } on FirebaseAuthException catch (e) {
                          if (e.code == "user-not-found") {
                            showSnakBar(
                              context,
                              "No user found for that email.",
                            );
                          } else if (e.code == 'wrong-password') {
                            showSnakBar(
                              context,
                              "Wrong password provided for that user.",
                            );
                          }
                          
                        }
                         inAsyncCall = false;
                        setState(() {
                          
                        });
                      }

                      // Navigator.pushNamed(context, AppRoutes.homeRoute);
                    },
                  ),
                  const SizedBox(height: 20),
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
    var user = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }
}
