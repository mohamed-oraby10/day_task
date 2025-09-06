import 'package:flutter/material.dart';

class ScheduleCategory extends StatelessWidget {
  const ScheduleCategory({
    super.key,
    required this.color,
    required this.number,
    required this.day,
    this.onTap,
    required this.dayNameColor,
    required this.dayNumberColor,
  });
  final Color color;
  final String number;
  final String day;
  final void Function()? onTap;
  final Color dayNumberColor;
  final Color dayNameColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: GestureDetector(
        onTap: onTap,
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
                style: TextStyle(
                  color: dayNumberColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(day, style: TextStyle(color: dayNumberColor, fontSize: 15)),
            ],
          ),
        ),
      ),
    );
  }
}
