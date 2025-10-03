import 'package:day_task/enum.dart';
import 'package:day_task/widgets/chat_person.dart';
import 'package:day_task/widgets/custom_app_bar.dart';
import 'package:day_task/widgets/custom_button.dart';
import 'package:day_task/utilitis/app_routes.dart';
import 'package:day_task/utilitis/custom_bottom_bar.dart';
import 'package:flutter/material.dart';

class MassegesScraan extends StatefulWidget {
  const MassegesScraan({super.key});

  @override
  State<MassegesScraan> createState() => _MassegesScraanState();
}

class _MassegesScraanState extends State<MassegesScraan> {
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
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                  text: 'Chat',
                  onPress: () {
                    Navigator.pushNamed(context, AppRoutes.messageRoute);
                  },
                  isMessage: true,
                ),
                SizedBox(width: 20),
                CustomButton(
                  text: 'Groupes',
                  onPress: () {
                    Navigator.pushNamed(context, AppRoutes.groupRoute);
                  },
                  isMessage: false,
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 2,
              itemBuilder: (context, index) {
                return ChatPerson();
              },
            ),
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(vertical: 70, horizontal: 10),
        child: CustomButton(
          text: "Start Chat",
          isMessage: true,
          onPress: () {
            Navigator.pushNamed(context, AppRoutes.newMessageRoute);
          },
        ),
      ),
    );
  }
}
