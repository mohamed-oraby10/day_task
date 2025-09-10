import 'package:day_task/constants.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class PercentCircular extends StatelessWidget {
  const PercentCircular({super.key, required this.percent, required this.backgroundColor});
  final double percent;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: 30,
      lineWidth: 2,
      percent: percent,
      startAngle: 180,
      center: Text("75%", style: TextStyle(fontSize: 14, color: Colors.white)),
      progressColor: kMainColor,
      backgroundColor: backgroundColor,
      circularStrokeCap: CircularStrokeCap.round,
    );
  }
}
