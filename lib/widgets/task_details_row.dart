import 'package:day_task/constants.dart';
import 'package:day_task/model/project_model.dart';
import 'package:day_task/model/task_model.dart';
import 'package:day_task/widgets/container_button.dart';
import 'package:day_task/widgets/task_members_images.dart';
import 'package:day_task/widgets/team_members_images.dart';
import 'package:flutter/material.dart';

class TaskDetailsRow extends StatefulWidget {
  const TaskDetailsRow({
    super.key,
    required this.iconImage,
    required this.title,
    this.content,
    this.project, this.task,
  });
  final String iconImage;
  final String title;
  final String? content;
  final ProjectModel? project;
  final TaskModel? task;

  @override
  State<TaskDetailsRow> createState() => _TaskDetailsRowState();
}

class _TaskDetailsRowState extends State<TaskDetailsRow> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ContainerButton(image: widget.iconImage, height: 50, width: 50),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.title, style: TextStyle(color: kLabelTextColor)),
            SizedBox(height: 5),
            widget.content == null
                ? widget.project == null ? TaskMembersImages(task: widget.task!) : TeamMembersImages(project: widget.project!)
                : Text(
                    widget.content!,
                    style: TextStyle(color: Colors.white, fontSize: 17),
                  ),
          ],
        ),
      ],
    );
  }
}
