import 'package:day_task/utilitis/app_colors.dart';
import 'package:flutter/material.dart';


class MessageCategory extends StatelessWidget {
 const MessageCategory({super.key, required this.image, required this.name, required this.text});

 final String image;
 final String name;
 final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 50),
      child: Row(
        children: [
          Image.asset(image),
          Material(
            color: AppColors.backgroundColor,
            child: InkWell(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      text,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
