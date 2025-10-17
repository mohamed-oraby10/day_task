import 'package:day_task/constants.dart';
import 'package:day_task/provider/user_provider.dart';
import 'package:day_task/service/sign_out_service.dart';
import 'package:day_task/widgets/custom_app_bar.dart';
import 'package:day_task/widgets/logout_button.dart';
import 'package:day_task/widgets/profile_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key, this.name});
  final String? name;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool inAsyncCall = false;
  @override
  Widget build(BuildContext context) {
    var user = Provider.of<UserProvider>(context);
    final firstLetter = user.userModel?.name[0].toUpperCase() ?? '?';
    return ModalProgressHUD(
      inAsyncCall: inAsyncCall,
      child: Scaffold(
        appBar: CustomAppBar(title: "Profile"),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20.h),
                child: Center(
                  child: CircleAvatar(
                    radius: 67.r,
                    backgroundColor: kMainColor,
                    child: CircleAvatar(
                      radius: 65.r,
                      backgroundImage: user.userModel?.image != null
                          ? NetworkImage(user.userModel!.image!)
                          : null,
                      child: user.userModel?.image == null
                          ? Text(firstLetter, style: TextStyle(fontSize: 30.sp))
                          : null,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              ProfileCategory(
                text: user.userModel?.name ?? "",
                preImage: 'assets/images/useradd.svg',
                postImage: 'assets/images/edit.svg',
              ),
              ProfileCategory(
                text: user.userModel?.email ?? '',
                preImage: 'assets/images/usertag.svg',
                postImage: 'assets/images/edit.svg',
              ),

              ProfileCategory(
                text: 'My Tasks',
                preImage: 'assets/images/task.svg',
                postImage: 'assets/images/arrowdown2.svg',
              ),
              ProfileCategory(
                text: 'Privacy',
                preImage: 'assets/images/securitycard.svg',
                postImage: 'assets/images/arrowdown2.svg',
              ),
              ProfileCategory(
                text: 'Setting',
                preImage: 'assets/images/setting2.svg',
                postImage: 'assets/images/arrowdown2.svg',
              ),
              LogoutButton(
                onPress: () async {
                  setState(() {
                    inAsyncCall = true;
                  });
                  await signOut(context);
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
