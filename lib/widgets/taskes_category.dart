import 'package:day_task/constants.dart';
import 'package:day_task/model/task_model.dart';
import 'package:day_task/widgets/task_members_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TaskesCategory extends StatelessWidget {
  const TaskesCategory({super.key, this.onTap, required this.task});
  final TaskModel task;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 7.h),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          children: [
            Container(height: 72.h, width: 10.w, color: kMainColor),
            Container(
              padding: EdgeInsets.all(6.r),
              color: kSecondColor,
              height: 72.h,
              width: 370.w,
              child: Padding(
                padding: EdgeInsets.only(left: 15.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 5.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              task.title,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 18.sp,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 5.h),
                            Text(
                              task.time,
                              style: TextStyle(
                                color: kLabelTextColor,
                                fontSize: 12.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    Flexible(
                      child: TaskMembersImages(
                        task: task,
                        imagesColor: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
