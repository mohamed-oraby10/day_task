import 'package:day_task/constants.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class PercentCircular extends StatelessWidget {
  const PercentCircular({super.key});

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: 30,
      lineWidth: 2,
      percent: 0.6,
      startAngle: 180,
      center: Text("60%", style: TextStyle(fontSize: 14, color: Colors.white)),
      progressColor: kMainColor,
      backgroundColor: kFillTextFormColor,
      circularStrokeCap: CircularStrokeCap.round,
    );
  }
}
