import 'package:day_task/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CirculerAvatarImage extends StatelessWidget {
  const CirculerAvatarImage({
    super.key,
    required this.name,
    required this.urlImage,
    required this.image,
  });
  final String name;
  final String urlImage;
  final String? image;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 20.r,
      backgroundColor: kMainColor,
      backgroundImage: image != null ? NetworkImage(urlImage) : null,
      child: image == null
          ? Text(
              name,
              style: TextStyle(color: Colors.black, fontSize: 22.sp),
            )
          : null,
    );
  }
}
