import 'package:day_task/model/user_model.dart';
import 'package:day_task/widgets/default_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewMessageCategory extends StatelessWidget {
  const NewMessageCategory({super.key, required this.user, this.onTap});
  final UserModel user;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 5.h),
      child: GestureDetector(
        onTap: onTap,
        child: ListTile(
          leading: user.image == null
              ? DefaultImage(name: user.name)
              : CircleAvatar(
                  radius: 22.r,
                  backgroundImage: NetworkImage(user.image!),
                ),
          title: Text(
            user.name,
            softWrap: true,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
