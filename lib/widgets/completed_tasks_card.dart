import 'package:day_task/utilitis/app_routes.dart';
import 'package:flutter/material.dart';

class CompletedTasksCrad extends StatelessWidget {
  const CompletedTasksCrad({
    super.key,
    required this.taskName,
    required this.taskColor,
    required this.fontColor,
    required this.taskImage,
  });
  final String taskName;
  final Color taskColor;
  final Color fontColor;
  final String taskImage;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 7),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, AppRoutes.taskDetailsRoute);
        },
        child: Container(
          padding: EdgeInsets.all(8),
          width: 200,
          height: 180,
          color: taskColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                taskName,
                style: TextStyle(
                  color: fontColor,
                  fontSize: 20,
                  fontFamily: "PilatExtended",
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  children: [
                    Text(
                      'Team Members',
                      style: TextStyle(color: fontColor, fontSize: 14),
                    ),
                    const Spacer(flex: 2),
                    Image.asset('assets/images/Ellipse 1.png'),
                    Image.asset('assets/images/Ellipse 2.png'),
                    Image.asset('assets/images/Ellipse 3.png'),
                    Image.asset('assets/images/Ellipse 4.png'),
                    const Spacer(flex: 1),
                  ],
                ),
              ),
              Row(
                children: [
                  Text(
                    'Completed',
                    style: TextStyle(color: fontColor, fontSize: 14),
                  ),
                  const Spacer(flex: 4),
                  Text(
                    '100%',
                    style: TextStyle(color: fontColor, fontSize: 14),
                  ),
                  const Spacer(flex: 1),
                ],
              ),
              Image.asset(taskImage),
            ],
          ),
        ),
      ),
    );
  }
}
