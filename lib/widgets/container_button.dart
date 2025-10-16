import 'package:day_task/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ContainerButton extends StatelessWidget {
  const ContainerButton({
    super.key,
    required this.image,
    required this.height,
    required this.width,
  });
  final String image;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      color: kMainColor,
      child: IconButton(
        onPressed: () {},
        icon: SvgPicture.asset(image, height: 24.h, width: 24.w),
      ),
    );
  }
}
