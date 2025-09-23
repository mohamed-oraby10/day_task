import 'package:day_task/constants.dart';
import 'package:day_task/model/project_model.dart';
import 'package:day_task/widgets/container_button.dart';
import 'package:flutter/material.dart';

class TaskDetailsRow extends StatefulWidget {
  const TaskDetailsRow({
    super.key,
    required this.iconImage,
    required this.title,
    this.content,  this.project,
  });
  final String iconImage;
  final String title;
  final String? content;
  final ProjectModel? project;

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
                ? SizedBox(
                    height: 20,
                    width: 100,
                    child: Stack(
                      children: List.generate(widget.project!.projectTeam.length, (
                        index,
                      ) {
                        final member = widget.project!.projectTeam[index];

                        return Positioned(
                          left: index * 25,
                          child: CircleAvatar(
                            radius: 10,
                            backgroundColor: kMainColor,
                            backgroundImage:
                                (member.image != null &&
                                    member.image!.isNotEmpty)
                                ? NetworkImage(member.image!)
                                : null,
                            child:
                                (member.image == null || member.image!.isEmpty)
                                ? Text(
                                    member.name.isNotEmpty
                                        ? member.name[0].toUpperCase()
                                        : "?",
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
                  )
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
