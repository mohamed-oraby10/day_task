import 'package:day_task/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class PercentCircular extends StatelessWidget {
  const PercentCircular({super.key, required this.percent, required this.backgroundColor});
  final double percent;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: 30.r,
      lineWidth: 2.w,
      percent: percent,
      startAngle: 180,
      center: Text("${(percent*100).toInt()}%", style: TextStyle(fontSize: 14.sp, color: Colors.white)),
      progressColor: kMainColor,
      backgroundColor: backgroundColor,
      circularStrokeCap: CircularStrokeCap.round,
    );
  }
}
