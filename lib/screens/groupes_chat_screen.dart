import 'package:day_task/enum.dart';
import 'package:day_task/widgets/custom_app_bar.dart';
import 'package:day_task/widgets/custom_button.dart';
import 'package:day_task/widgets/message_category.dart';
import 'package:day_task/utilitis/app_routes.dart';
import 'package:day_task/utilitis/custom_bottom_bar.dart';
import 'package:flutter/material.dart';

class GroupesChatScreen extends StatelessWidget {
  const GroupesChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomBottomNavigationBar(
        selectedMenu: MenuState.chat,
      ),
      appBar: CustomAppBar(
        title: 'Messages',
        sufImage: "assets/images/edit.svg",
        onPress: () {
          Navigator.pushNamed(context, AppRoutes.newMessageRoute);
        },
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButton(
                  text: "Chat",
                  onPress: () {
                    Navigator.pop(context);
                  },
                ),
                CustomButton(text: "Groupes"),
              ],
            ),
          ),
          MessageCategory(
            image: 'assets/images/Ellipse 36 (1).png',
            name: 'Android developer',
            text: 'Robert: Did you check the last task? 15:35',
          ),
        ],
      ),
    );
  }
}
