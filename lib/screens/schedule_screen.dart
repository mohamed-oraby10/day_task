import 'package:day_task/constants.dart';
import 'package:day_task/enum.dart';
import 'package:day_task/widgets/custom_app_bar.dart';
import 'package:day_task/widgets/schedule_category.dart';
import 'package:day_task/widgets/taskes_category.dart';
import 'package:day_task/utilitis/custom_bottom_bar.dart';
import 'package:flutter/material.dart';

class ScheduleSceen extends StatelessWidget {
  const ScheduleSceen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomBottomNavigationBar(
        selectedMenu: MenuState.calendar,
      ),
      appBar: CustomAppBar(
        title: "Schedule",
        sufImage: "assets/images/addsquare.svg",
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'November',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: SizedBox(
                height: 75,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return ScheduleCategory(
                      color: kSecondColor,
                      number: '1',
                      day: 'Mon',
                    );
                  },
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Today\'s Tasks',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),

            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return TaskesCategory(
                    text: 'User Interviews',
                    color: kSecondColor,
                    firstImage: 'assets/images/Ellipse 47.png',
                    secondImage: 'assets/images/Ellipse 45.png',
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
