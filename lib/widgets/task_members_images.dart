import 'package:day_task/constants.dart';
import 'package:day_task/model/task_model.dart';
import 'package:flutter/material.dart';

class TaskMembersImages extends StatelessWidget {
  const TaskMembersImages({super.key, required this.task,  this.imagesColor = kMainColor});
  final TaskModel task;
  final Color imagesColor;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25,
      width: 80,
      child: Stack(
        children: List.generate(task.teamMembers.length, (index) {
          final member = task.teamMembers[index];

          return Positioned(
            left: index * 15,
            child: CircleAvatar(
              radius: 10,
              backgroundColor: imagesColor,
              backgroundImage:
                  (member.image != null && member.image!.isNotEmpty)
                  ? NetworkImage(member.image!)
                  : null,
              child: (member.image == null || member.image!.isEmpty)
                  ? Text(
                      member.name.isNotEmpty
                          ? member.name[0].toUpperCase()
                          : "?",
                      style: const TextStyle(
                        color: kBackgroundColor,
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  : null,
            ),
          );
        }),
      ),
    );
  }
}
