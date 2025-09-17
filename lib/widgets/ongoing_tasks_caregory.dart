import 'package:day_task/constants.dart';
import 'package:day_task/model/task_model.dart';
import 'package:day_task/widgets/percent_circular.dart';
import 'package:flutter/material.dart';

class OngoingTasks extends StatelessWidget {
  const OngoingTasks({
    super.key,
   required this.task,
  });

 
  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Container(
          padding: EdgeInsets.all(8),

          color: kFillTextFormColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  task.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontFamily: "PilatExtended",
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                const Text(
                  'Team Members',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                SizedBox(
  height: 40,
  child: Stack(
    children: List.generate(task.teamMembers.length, (index) {
      final member = task.teamMembers[index];

      return Positioned(
        left: index * 25, // عشان الصور تتراكب زي الـ screenshot
        child: CircleAvatar(
          radius: 18,
          backgroundColor: kMainColor,
          backgroundImage: (member.image != null && member.image!.isNotEmpty)
              ? NetworkImage(member.image!)
              : null,
          child: (member.image == null || member.image!.isEmpty)
              ? Text(
                  member.name.isNotEmpty ? member.name[0].toUpperCase() : "?",
                  style: const TextStyle(
                    color: kBackgroundColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                )
              : null,
        ),
      );
    }),
  ),
),

                Text(
                 "Due on: ${task.date}",
                  style: const TextStyle(color: Colors.white, fontSize: 15),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
