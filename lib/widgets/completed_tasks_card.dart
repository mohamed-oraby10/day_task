import 'package:day_task/constants.dart';
import 'package:day_task/model/project_model.dart';
import 'package:day_task/widgets/team_members_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CompletedTasksCrad extends StatelessWidget {
  const CompletedTasksCrad({super.key, required this.project, this.onTap});
  final ProjectModel project;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(right: 7.w, top: 10.h),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          width: 200.w,
          height: 170.h,
          color: kMainColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 65.w,
                child: Text(
                  project.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 21.sp,
                    fontFamily: "PilatExtended",
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding:  EdgeInsets.symmetric(vertical: 8.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Team Members',
                      style: TextStyle(color: Colors.black, fontSize: 12.sp),
                    ),
                    TeamMembersImages(
                      project: project,
                      imagesColor: Colors.white,
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Completed',
                    style: TextStyle(color: Colors.black, fontSize: 14.sp),
                  ),
                  Text(
                    "${(project.progressPercent * 100).toInt()}%",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 11.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              LinearProgressIndicator(
                value: project.progressPercent,
                color: Colors.black,
                minHeight: 6.h,
                borderRadius: BorderRadius.circular(50.r),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
