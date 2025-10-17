import 'package:day_task/constants.dart';
import 'package:day_task/model/project_model.dart';
import 'package:day_task/widgets/percent_circular.dart';
import 'package:day_task/widgets/team_members_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OngoingTasks extends StatelessWidget {
  const OngoingTasks({super.key, required this.project, this.onTap});

  final ProjectModel project;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding:  EdgeInsets.only(bottom: 14.h),
        child: Container(
          padding: EdgeInsets.all(8),

          color: kFillTextFormColor,
          child: Padding(
            padding:  EdgeInsets.symmetric(vertical: 4.h, horizontal: 8.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  project.title,
                  style:  TextStyle(
                    color: Colors.white,
                    fontSize: 18.sp,
                    fontFamily: "PilatExtended",
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.symmetric(vertical: 8.h),
                  child:  Text(
                    'Team Members',
                    style: TextStyle(color: Colors.white, fontSize: 15.sp),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TeamMembersImages(project: project,),
                    PercentCircular(
                      backgroundColor: kBackgroundColor,
                      percent: project.progressPercent,
                    ),
                  ],
                ),

                Text(
                  "Due on: ${project.date}",
                  style:  TextStyle(color: Colors.white, fontSize: 15.sp),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
