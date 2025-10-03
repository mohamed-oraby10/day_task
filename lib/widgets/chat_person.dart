import 'package:day_task/constants.dart';
import 'package:day_task/utilitis/app_routes.dart';
import 'package:flutter/material.dart';

class ChatPerson extends StatelessWidget {
  const ChatPerson({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),

      child: Row(
        children: [
          Image.asset('assets/images/Ellipse 381.png'),
          Material(
            color: kBackgroundColor,
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.chatingRoute);
              },
              child: const Padding(
                padding: EdgeInsets.only(left: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Olivia Anna',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Hi please check the task, that i',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Color(0xffB8B8B8), fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Spacer(),
          Text(
            '31 min',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Color(0xffB8B8B8), fontSize: 12),
          ),
        ],
      ),
    );
  }
}
