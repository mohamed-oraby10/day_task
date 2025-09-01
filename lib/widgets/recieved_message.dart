import 'package:day_task/constants.dart';
import 'package:flutter/material.dart';

class RecievedMessage extends StatelessWidget {
  const RecievedMessage({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          padding: EdgeInsetsDirectional.symmetric(
            vertical: 12,
            horizontal: 20,
          ),
          color: kSecondColor,
          child: Text(
            text,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
