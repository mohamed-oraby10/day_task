import 'package:flutter/material.dart';

void animationToSelectedDay(
  BuildContext context,
  int selectedIndex,
  ScrollController scrollController,
) {
  final screenWidth = MediaQuery.of(context).size.width;

  const itemWidth = 70.0;

  final targetOffset =
      (selectedIndex - 1) * itemWidth - (screenWidth / 2) + (itemWidth / 2);

  final double safeOffset = targetOffset < 0 ? 0 : targetOffset;
  scrollController.animateTo(
    safeOffset,
    duration: Duration(milliseconds: 500),
    curve: Curves.easeInOut,
  );
}
