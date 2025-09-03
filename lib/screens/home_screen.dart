import 'package:day_task/enum.dart';
import 'package:day_task/screens/profile_screen.dart';
import 'package:day_task/widgets/custom_row.dart';
import 'package:day_task/widgets/completed_tasks_card.dart';
import 'package:day_task/widgets/home_search_bar.dart';
import 'package:day_task/widgets/ongoing_tasks_caregory.dart';
import 'package:day_task/utilitis/app_colors.dart';
import 'package:day_task/utilitis/app_routes.dart';
import 'package:day_task/utilitis/custom_bottom_bar.dart';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, this.name});
  final String? name;
  
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomBottomNavigationBar(
        selectedMenu: MenuState.home,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            SizedBox(height: 30),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome Back!',
                      style: TextStyle(
                        color: AppColors.mainColor,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      widget.name ?? "",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontFamily: "PilatExtended",
                      ),
                    ),
                  ],
                ),
                const Spacer(flex: 1),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return ProfileScreen(name: widget.name);
                        },
                      ),
                    );
                  },
                  icon: Image.asset('assets/images/Rectangle 6.png'),
                ),
              ],
            ),
            SizedBox(height: 20),
            HomeSearchBar(),
            SizedBox(height: 20),
            CustomRow(title: "Completed tasks"),
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return CompletedTasksCrad(
                    taskName: 'Real Estate\nWebsite Design',
                    taskColor: AppColors.mainColor,
                    fontColor: Colors.black,
                    taskImage: 'assets/images/Rectangle 12.png',
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            CustomRow(title: "Ongoing Projects"),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return OngoingTasks(
                    name: 'Mobile App Wireframe',
                    date: 'Due on : 21 March',
                    image: 'assets/images/75%.png',
                    percentageImage: 'assets/images/Ellipse 16 (1).png',
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
