import 'package:day_task/constants.dart';
import 'package:day_task/model/task_model.dart';
import 'package:day_task/widgets/task_members_images.dart';
import 'package:flutter/material.dart';

class TaskesCategory extends StatelessWidget {
  const TaskesCategory({super.key, this.onTap, required this.task});
  final TaskModel task;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          children: [
            Container(height: 70, width: 10, color: kMainColor),
            Container(
              color: kSecondColor,
              height: 70,
              width: 345,
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            task.title,
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            task.time,
                            style: TextStyle(
                              color: kLabelTextColor,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),

                    TaskMembersImages(task: task, imagesColor: Colors.white),
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
