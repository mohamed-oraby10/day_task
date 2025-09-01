import 'package:day_task/enum.dart';
import 'package:day_task/widgets/custom_app_bar.dart';
import 'package:day_task/widgets/custom_button.dart';
import 'package:day_task/utilitis/app_colors.dart';
import 'package:day_task/utilitis/app_routes.dart';
import 'package:day_task/utilitis/custom_bottom_bar.dart';
import 'package:flutter/material.dart';

class MassegesScraan extends StatelessWidget {
  const MassegesScraan({super.key});

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
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                  text: 'Chat',
                  onPress: () {
                    Navigator.pushNamed(context, AppRoutes.messageRoute);
                  },
                ),
                SizedBox(width: 20),
                CustomButton(
                  text: 'Groupes',
                  onPress: () {
                    Navigator.pushNamed(context, AppRoutes.groupRoute);
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 50),
            child: Row(
              children: [
                Image.asset('assets/images/Ellipse 381.png'),
                Material(
                  color: AppColors.backgroundColor,
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
                          Text(
                            ' Hi please check the task, that i.... 43 min',
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Align(
              alignment: Alignment.bottomRight,
              child: CustomButton(
                text: "Start Chat",
                // buttonColor: AppColors.mainColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
