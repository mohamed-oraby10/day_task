import 'package:day_task/widgets/custom_app_bar.dart';
import 'package:day_task/widgets/logout_button.dart';
import 'package:day_task/widgets/profile_category.dart';
import 'package:day_task/utilitis/app_colors.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    backgroundImage: AssetImage('assets/images/Ellipse 36.png'),
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
            LogoutButton(),
          ],
        ),
      ),
    );
  }
}
