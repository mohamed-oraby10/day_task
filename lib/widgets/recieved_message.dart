import 'package:day_task/constants.dart';
import 'package:day_task/model/message_model.dart';
import 'package:flutter/material.dart';

class RecievedMessage extends StatelessWidget {
  const RecievedMessage({super.key, required this.message});
  final MessageModel message;
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
            message.message,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
