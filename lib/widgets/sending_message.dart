import 'package:day_task/utilitis/app_colors.dart';
import 'package:flutter/material.dart';

class SendingMeaasge extends StatelessWidget {
  const SendingMeaasge({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Align(
        alignment: Alignment.centerRight,
        child: Container(
          padding: EdgeInsetsDirectional.symmetric(
            vertical: 12,
            horizontal: 20,
          ),
          color: AppColors.mainColor,
          child: Text(
            text,
            style: const TextStyle(
              color: AppColors.backgroundColor,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
