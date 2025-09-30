import 'package:day_task/constants.dart';
import 'package:day_task/widgets/chat_text_field.dart';
import 'package:day_task/widgets/recieved_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset("assets/images/arrowleft.svg"),
        ),
        backgroundColor: kBackgroundColor,
        elevation: 0,
        foregroundColor: Colors.white,

        title: const Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/Ellipse 381.png'),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Olivia Anna', style: TextStyle(fontSize: 14)),
                  Text(
                    'Online',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset('assets/images/video.svg'),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: IconButton(
              onPressed: () {},
              icon: SvgPicture.asset('assets/images/callcalling.svg'),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return RecievedMessage(
                        text: 'Hi, please check the new task.',
                      );
                    },
                  ),
                ),

                // RecievedMessage(text: 'Hi, please check the new task.'),
                // SendingMeaasge(text: 'Hi, please check the new task.'),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ChatTextField(),
                      SizedBox(width: 10),

                      Container(
                        height: 55,
                        width: 55,
                        color: kSecondColor,
                        child: IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset(
                            'assets/images/microphone2.svg',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
