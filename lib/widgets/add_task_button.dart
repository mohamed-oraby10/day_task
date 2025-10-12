import 'package:day_task/constants.dart';
import 'package:day_task/utilitis/app_routes.dart';
import 'package:day_task/widgets/main_button.dart';
import 'package:flutter/material.dart';

class AddTaskButton extends StatelessWidget {
  const AddTaskButton({super.key, required this.projectKey});
  final int projectKey;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50),
      height: 115,
      width: double.maxFinite,
      color: kSecondColor,
      child: Center(
        child: MainButton(
          textButton: "Add Task",
          onPress: () {
            Navigator.pushNamed(
              context,
              AppRoutes.createTaskRoute,
              arguments: projectKey,
            );
          },
        ),
      ),
    );
  }
}
