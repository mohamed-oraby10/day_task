import 'package:day_task/constants.dart';
import 'package:flutter/material.dart';

class NotificationCategory extends StatelessWidget {
  const NotificationCategory({
    super.key,
    required this.image,
    required this.text,
    this.onPress,
  });
  final String image;
  final String text;
  final void Function()? onPress;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: GestureDetector(
        onTap: onPress,
        child: Row(
          children: [
            Image.asset(image, height: 45, width: 45),
            Material(
              color: kBackgroundColor,
              child: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          text,
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                        const Text(
                          ' left a comment in task',
                          style: TextStyle(color: kLabelTextColor),
                        ),
                      ],
                    ),
                    const Text(
                      'Mobile App Design Project',
                      style: TextStyle(
                        color: kMainColor,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(flex: 1),
            const Text(
              '31 min',
              style: TextStyle(color: Colors.white, fontSize: 10),
            ),
          ],
        ),
      ),
    );
  }
}
