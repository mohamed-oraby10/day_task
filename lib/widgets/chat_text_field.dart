import 'package:day_task/constants.dart';
import 'package:day_task/utilitis/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChatTextField extends StatelessWidget {
  const ChatTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
       
        hint: Text(
          "Type a message",
          style: TextStyle(color: AppColors.labelTextColor, fontSize: 16),
        ),
        prefixIcon: IconButton(
          onPressed: () {},
          icon: SvgPicture.asset("assets/images/elementequal.svg"),
        ),
        suffixIcon: IconButton(
          onPressed: () {},
          icon: SvgPicture.asset("assets/images/send.svg"),
        ),

        fillColor: kSecondColor,
        filled: true,
      ),
    );
  }
}
