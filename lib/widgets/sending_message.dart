import 'package:day_task/constants.dart';
import 'package:day_task/model/message_model.dart';
import 'package:flutter/material.dart';

class SendingMeaasge extends StatelessWidget {
  const SendingMeaasge({super.key, required this.message});
  final MessageModel message;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Align(
        alignment: Alignment.centerRight,
        child: Container(
          constraints: BoxConstraints(maxWidth: screenWidth * 0.7),
          padding: EdgeInsetsDirectional.symmetric(horizontal: 5),
          color: kMainColor,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  right: 30,
                  bottom: 12,
                  top: 12,
                  left: 12,
                ),
                child: Text(
                  message.message,
                  style: const TextStyle(
                    color: kBackgroundColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              if (message.isSeen)
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Text(
                    'Seen',
                    style: const TextStyle(
                      color: kBackgroundColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
