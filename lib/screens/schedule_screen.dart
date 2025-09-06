import 'package:day_task/constants.dart';
import 'package:day_task/enum.dart';
import 'package:day_task/widgets/custom_app_bar.dart';
import 'package:day_task/widgets/schedule_category.dart';
import 'package:day_task/widgets/taskes_category.dart';
import 'package:day_task/utilitis/custom_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ScheduleSceen extends StatefulWidget {
  const ScheduleSceen({super.key});

  @override
  State<ScheduleSceen> createState() => _ScheduleSceenState();
}

class _ScheduleSceenState extends State<ScheduleSceen> {
  late int selectedIndex;

  @override
  void initState() {
    selectedIndex = DateTime.now().day;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    int daysInMonth = DateUtils.getDaysInMonth(now.year, now.month);

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
              DateFormat('MMMM').format(now),
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: SizedBox(
                height: 75,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: daysInMonth,
                  itemBuilder: (context, index) {
                    DateTime date = DateTime(now.year, now.month, index + 1);
                    String dayNumber = DateFormat('d').format(date);
                    String dayName = DateFormat('EEE').format(date);
                    bool isSelected = index == selectedIndex;

                    return ScheduleCategory(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      color: isSelected ? kMainColor : kSecondColor,
                      dayNameColor: isSelected
                          ? kBackgroundColor
                          : Colors.white,
                      dayNumberColor: isSelected
                          ? kBackgroundColor
                          : Colors.white,
                      number: dayNumber,
                      day: dayName,
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
