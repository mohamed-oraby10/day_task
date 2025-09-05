import 'package:day_task/constants.dart';
import 'package:flutter/material.dart';

class CutomTasks extends StatelessWidget {
  const CutomTasks({super.key, required this.taskTitle});
  final String taskTitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12),
        height: 60,
        width: double.infinity,
        color: kFillTextFormColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              taskTitle,
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),

            Container(
              height: 40,
              width: 40,
              color: kMainColor,
              child: Center(
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.check_circle_outline_outlined,
                    color: kBackgroundColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
