import 'package:day_task/widgets/custom_app_bar.dart';
import 'package:day_task/widgets/logout_button.dart';
import 'package:day_task/widgets/profile_category.dart';
import 'package:day_task/utilitis/app_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool inAsyncCall = false;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: inAsyncCall,
      child: Scaffold(
        appBar: CustomAppBar(title: "Profile"),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Center(
                  child: CircleAvatar(
                    radius: 60,
                    backgroundColor: AppColors.mainColor,
                    child: CircleAvatar(
                      radius: 55,
                      backgroundImage: AssetImage(
                        'assets/images/Ellipse 36.png',
                      ),
                    ),
                  ),
                ),
              ),
              ProfileCategory(
                text: '  Fazil Laghari',
                preImage: 'assets/images/useradd.svg',
                postImage: 'assets/images/edit.svg',
              ),
              ProfileCategory(
                text: '  fazzzil72@gmail.com',
                preImage: 'assets/images/usertag.svg',
                postImage: 'assets/images/edit.svg',
              ),
              ProfileCategory(
                text: '  Password',
                preImage: 'assets/images/lock.svg',
                postImage: 'assets/images/edit.svg',
              ),
              ProfileCategory(
                text: '  My Tasks',
                preImage: 'assets/images/task.svg',
                postImage: 'assets/images/arrowdown2.svg',
              ),
              ProfileCategory(
                text: '  Privacy',
                preImage: 'assets/images/securitycard.svg',
                postImage: 'assets/images/arrowdown2.svg',
              ),
              ProfileCategory(
                text: '  Setting',
                preImage: 'assets/images/setting2.svg',
                postImage: 'assets/images/arrowdown2.svg',
              ),
              LogoutButton(
                onPress: () async {
                   setState(() {
                    inAsyncCall = true;
                  });
                  await FirebaseAuth.instance.signOut();
                  setState(() {
                    inAsyncCall = false;
                  });
                },
                 
              ),
            ],
          ),
        ),
      ),
    );
  }
}
