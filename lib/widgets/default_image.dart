import 'package:day_task/constants.dart';
import 'package:flutter/material.dart';

class DefaultImage extends StatelessWidget {
  const DefaultImage({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: kMainColor,
      child: Text(
        name.isNotEmpty ? name[0].toUpperCase() : "?",
        style: const TextStyle(
          color: kBackgroundColor,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
