import 'package:day_task/constants.dart';
import 'package:day_task/enum.dart';
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
        // mainAxisSize: MainAxisSize.min,
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
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
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
                            style: TextStyle(
                              color: Color(0xffB8B8B8),
                              fontSize: 12,
                            ),
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
