import 'package:day_task/constants.dart';
import 'package:day_task/model/task_model.dart';
import 'package:day_task/widgets/task_check_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CutomTasks extends StatelessWidget {
  const CutomTasks({
    super.key,
    this.onTap,
    required this.onCheckChanged,
    required this.isChecked,
    required this.task,
  });
  final void Function()? onTap;
  final bool isChecked;
  final ValueChanged<bool?> onCheckChanged;
  final TaskModel task;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 7.h),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
          width: double.infinity,
          color: kFillTextFormColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  task.title,
                  style: TextStyle(color: Colors.white, fontSize: 18.sp),
                ),
              ),

              Center(
                child: TaskCheckBox(
                  value: isChecked,
                  onChanged: onCheckChanged,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
