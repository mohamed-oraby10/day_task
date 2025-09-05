import 'package:day_task/constants.dart';
import 'package:day_task/widgets/container_button.dart';
import 'package:flutter/material.dart';

class TaskDetailsRow extends StatelessWidget {
  const TaskDetailsRow({super.key, required this.iconImage, required this.title, required this.content});
  final String iconImage;
  final String title;
  final String content;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ContainerButton(
          image:iconImage,
          height: 50,
          width: 50,
        ),
        SizedBox(width: 10),
        Column(
          children: [
            Text(title, style: TextStyle(color: kLabelTextColor)),
            SizedBox(height: 5),
            Text(
             content,
              style: TextStyle(color: Colors.white, fontSize: 17),
            ),
          ],
        ),
      ],
    );
  }
}
