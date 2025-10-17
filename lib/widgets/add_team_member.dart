import 'package:day_task/constants.dart';
import 'package:day_task/widgets/default_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AddTeamMember extends StatelessWidget {
  const AddTeamMember({
    super.key,
    this.memberName,
    this.onPress,
    this.memberImage,
  });
  final String? memberName;
  final String? memberImage;
  final void Function()? onPress;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 8.w),
      child: Container(
        height: 41.h,
        width: 150.w,
        color: kFillTextFormColor,
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 8.w),
              child: CircleAvatar(
                radius: 10.r,
                backgroundImage: (memberImage != null)
                    ? NetworkImage(memberImage!)
                    : null,
                child: (memberImage == null)
                    ? DefaultImage(name: memberName!)
                    : null,
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 8.w),
                child: Text(
                  memberName!,
                  style: TextStyle(color: Colors.white, fontSize: 14.sp),
                ),
              ),
            ),
            SizedBox(width: 4.w),
            IconButton(
              icon: SvgPicture.asset(
                'assets/images/closesquare.svg',
                width: 20.w,
                height: 20.h,
              ),
              onPressed: onPress,
            ),
          ],
        ),
      ),
    );
  }
}
