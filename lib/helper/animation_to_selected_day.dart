import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void animationToSelectedDay(
  BuildContext context,
  int selectedIndex,
  ScrollController scrollController,
) {
  double itemWidth = 55.w;
  double screenWidth = MediaQuery.of(context).size.width;

  double targetScroll =
      (selectedIndex * itemWidth) - (screenWidth / 2) + (itemWidth / 2);

  if (targetScroll < 0) targetScroll = 0;

  scrollController.animateTo(
    targetScroll,
    duration: const Duration(milliseconds: 500),
    curve: Curves.easeInOut,
  );
}
