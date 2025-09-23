import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:day_task/constants.dart';
import 'package:day_task/utilitis/app_routes.dart';
import 'package:day_task/widgets/continue.dart';
import 'package:day_task/widgets/main_button.dart';
import 'package:day_task/helper/snak_bar.dart';
import 'package:day_task/widgets/text_input.dart';
import 'package:flutter/material.dart';
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
      progressIndicator :CircularProgressIndicator(color: kMainColor,),
      inAsyncCall: inAsyncCall,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Form(
              key: formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 40),
                  Center(
                    child: SvgPicture.asset(
                      'assets/images/Group 5.svg',
                      height: 90,
                      width: double.infinity,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    'Create your Account',
                    style: const TextStyle(fontSize: 28, color: Colors.white),
                  ),
                  const SizedBox(height: 15),

                  Text(
                    'Full Name',
                    style: TextStyle(
                      color: kLabelTextColor,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 10),
                  TextInput(
                    hint: 'Enter your Full Name',
                    prefixIcon: Icons.person,
                    onChanged: (data) {
                      name = data;
                    },
                  ),
                  const SizedBox(height: 25),
                  const Text(
                    'Email Address',
                    style: TextStyle(
                      color: kLabelTextColor,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextInput(
                    hint: 'Enter your Email',
                    prefixIcon: Icons.email,
                    onChanged: (data) {
                      email = data;
                    },
                  ),
                  const SizedBox(height: 25),
                  const Text(
                    'Password',
                    style: TextStyle(
                      color: kLabelTextColor,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextInput(
                    hint: 'Enter your Password',
                    prefixIcon: Icons.lock,
                    onChanged: (data) {
                      password = data;
                    },
                    isPassword: true,
                  ),

                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Checkbox(
                        value: check,
                        onChanged: (value) {
                          check = value!;
                          setState(() {});
                        },

                        checkColor: kBackgroundColor,
                        fillColor: const WidgetStatePropertyAll(
                          kMainColor,
                        ),
                      ),
                      const Expanded(
                        child: Text(
                          'I have read & agreed to DayTask Privacy Policy, Terms & Condition',
                          style: TextStyle(
                            color: kLabelTextColor,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  MainButton(
                    textButton: 'Sign Up',
                    onPress: () async {
                      if (formkey.currentState!.validate() && check) {
                        inAsyncCall = true;
                        setState(() {});
                        try {
                          await registerUser();
                         
                          Navigator.pushNamed(
                            context,
                           AppRoutes.homeRoute
                          );
                          showSnakBar(context, 'Account created successfully');
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
                  const SizedBox(height: 20),
                  const Continue(isRegisterScreen: true),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> registerUser() async {
    UserCredential user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email!, password: password!);

    await user.user!.updateDisplayName(name);
    await user.user!.updatePhotoURL(null);

    await FirebaseFirestore.instance
        .collection('users')
        .doc(user.user!.uid)
        .set({
          'name': name,
          'email': email,
          'photo': null,
        }, SetOptions(merge: true));
  }
}
