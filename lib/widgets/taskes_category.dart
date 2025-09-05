import 'package:day_task/constants.dart';
import 'package:flutter/material.dart';

class TaskesCategory extends StatelessWidget {
  const TaskesCategory({
    super.key,
    required this.text,
    required this.color,
    required this.firstImage,
    required this.secondImage,
  });
  final String text;
  final Color color;
  final String firstImage;
  final String secondImage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Row(
        children: [
          Container(height: 70, width: 10, color: kMainColor),
          Container(
            color: color,
            height: 70,
            width: 345,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          text,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 5),
                        const Text(
                          '16:00 - 18:30',
                          style: TextStyle(
                            color: kLabelTextColor,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(flex: 1),
                  CircleAvatar(
                    radius: 14,
                    backgroundColor: Colors.black,
                    child: CircleAvatar(
                      radius: 12,
                      backgroundImage: AssetImage(firstImage),
                    ),
                  ),
                  CircleAvatar(
                    radius: 14,
                    backgroundColor: Colors.black,
                    child: CircleAvatar(
                      radius: 12,
                      backgroundImage: AssetImage(secondImage),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
