import 'package:flutter/material.dart';

class ScheduleCategory extends StatelessWidget {
  const ScheduleCategory({
    super.key,
    required this.color,
    required this.number,
    required this.day,
  });
  final Color color;
  final String number;
  final String day;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: Container(
        alignment: Alignment.center,
        height: 70,
        width: 45,
        color: color,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              number,
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
            Text(
              day,
              style: const TextStyle(color: Colors.white, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
