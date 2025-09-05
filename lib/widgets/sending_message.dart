import 'package:day_task/constants.dart';
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
          color: kMainColor,
          child: Text(
            text,
            style: const TextStyle(
              color: kBackgroundColor,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
