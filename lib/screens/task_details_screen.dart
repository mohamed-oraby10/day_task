import 'package:day_task/constants.dart';
import 'package:day_task/model/task_model.dart';
import 'package:day_task/widgets/custom_app_bar.dart';
import 'package:day_task/widgets/task_details_row.dart';
import 'package:flutter/material.dart';

class TaskDetailsScreen extends StatefulWidget {
  const TaskDetailsScreen({super.key});

  @override
  State<TaskDetailsScreen> createState() => _TaskDetailsScreenState();
}

class _TaskDetailsScreenState extends State<TaskDetailsScreen> {
  late TaskModel task;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    task = ModalRoute.of(context)!.settings.arguments as TaskModel;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Task Details',
        sufImage: "assets/images/edit.svg",
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            SizedBox(height: 30),
            Text(
              task.title,
              style: TextStyle(
                color: Colors.white,
                fontFamily: "PilatExtended",
                fontSize: 21,
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                children: [
                  TaskDetailsRow(
                    iconImage: 'assets/images/calendarremove.svg',
                    title: 'Due Date',
                    content: task.date,
                  ),
                  Spacer(flex: 2),
                  TaskDetailsRow(
                    iconImage: 'assets/images/profile2user.svg',
                    title: 'Task members',
                    task: task,
                  ),
                  Spacer(flex: 1),
                ],
              ),
            ),
            Text(
              "Task Details",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            SizedBox(height: 10),
            Flexible(
              child: SingleChildScrollView(
                child: Text(
                  task.details,
                  style: TextStyle(color: kLabelTextColor, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
