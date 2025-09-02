
import 'package:day_task/utilitis/app_colors.dart';
import 'package:flutter/material.dart';

void showSnakBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: AppColors.fillTextFormColor,
        content: Text(
          message,
          style: TextStyle(color: Colors.white, fontSize: 17),
        ),
      ),
    );
  }
