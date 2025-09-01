import 'package:day_task/enum.dart';
import 'package:day_task/widgets/custom_app_bar.dart';
import 'package:day_task/widgets/notifiy_category.dart';
import 'package:day_task/utilitis/custom_bottom_bar.dart';
import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomBottomNavigationBar(
        selectedMenu: MenuState.notifications,
      ),
      appBar: CustomAppBar(title: "Notifications"),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('New', style: TextStyle(color: Colors.white, fontSize: 20)),
            Expanded(
              child: ListView.builder(
                itemCount: 4,
                itemBuilder: (context, index) {
                  return NotificationCategory(
                    image: 'assets/images/Ellipse 381.png',
                    text: 'Olivia Anna ',
                  );
                },
              ),
            ),

            Text(
              'Earlier',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            Expanded(
              child: ListView.builder(
                 itemCount: 4,
                itemBuilder: (context, index) {
                  return NotificationCategory(
                    image: 'assets/images/Ellipse 40.png',
                    text: 'Robert Brown ',
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
