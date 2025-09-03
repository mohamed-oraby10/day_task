import 'package:day_task/utilitis/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfileCategory extends StatelessWidget {
  const ProfileCategory({
    super.key,
    required this.text,
    required this.preImage,
    required this.postImage,
    this.onPress,
  });
  final String text;
  final String preImage;
  final String postImage;
  final void Function()? onPress;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        color: AppColors.fillTextFormColor,
        width: double.infinity,
        height: 55,
        child: Padding(
          padding: const EdgeInsets.only(right: 8, left: 8),
          child: Row(
            children: [
              SvgPicture.asset(preImage),
              SizedBox(width: 8,),
              Text(
                text,
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
              const Spacer(flex: 1),
              IconButton(onPressed: onPress, icon: SvgPicture.asset(postImage,color: AppColors.labelTextColor,)),
            ],
          ),
        ),
      ),
    );
  }
}
