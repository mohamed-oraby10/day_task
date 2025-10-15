import 'package:day_task/constants.dart';
import 'package:day_task/cubits/task cubit/tasks of today cubit/tasks_of_today_cubit.dart';
import 'package:day_task/cubits/task cubit/tasks of today cubit/tasks_of_today_state.dart';
import 'package:day_task/enum.dart';
import 'package:day_task/helper/animation_to_selected_day.dart';
import 'package:day_task/screens/task_details_screen.dart';
import 'package:day_task/widgets/custom_app_bar.dart';
import 'package:day_task/widgets/schedule_category.dart';
import 'package:day_task/widgets/taskes_category.dart';
import 'package:day_task/utilitis/custom_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:day_task/provider/user_provider.dart';

class ScheduleSceen extends StatefulWidget {
  const ScheduleSceen({super.key});

  @override
  State<ScheduleSceen> createState() => _ScheduleSceenState();
}

class _ScheduleSceenState extends State<ScheduleSceen> {
  late int selectedIndex;
  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    selectedIndex = DateTime.now().day;
    scrollController = ScrollController();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      animationToSelectedDay(context, selectedIndex, scrollController);
    });
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    int daysInMonth = DateUtils.getDaysInMonth(now.year, now.month);

    return BlocProvider(
      create: (context) => TasksOfTodayCubit()..fetchAllTasksOfToday(),
      child: BlocConsumer<TasksOfTodayCubit, TasksOfTodayState>(
        listener: (context, state) async {
          if (state is TasksOfTodaySuccess) {}
        },
        builder: (context, state) {
          final currentUser = Provider.of<UserProvider>(
            context,
            listen: false,
          ).userModel;

          final allTasks = context.read<TasksOfTodayCubit>().tasks;
          final userTasks = allTasks.where((task) {
            if (task.teamMembers.isNotEmpty) {
              return task.teamMembers.any((m) => m.id == currentUser?.uid);
            }
            return false;
          }).toList();

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
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: SizedBox(
                      height: 75,
                      child: ListView.builder(
                        controller: scrollController,
                        scrollDirection: Axis.horizontal,
                        itemCount: daysInMonth,
                        itemBuilder: (context, index) {
                          DateTime date = DateTime(
                            now.year,
                            now.month,
                            index + 1,
                          );
                          String dayNumber = DateFormat('d').format(date);
                          String dayName = DateFormat('EEE').format(date);
                          bool isSelected = (index + 1) == selectedIndex;

                          return ScheduleCategory(
                            onTap: () {
                              setState(() {
                                selectedIndex = index + 1;
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
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      "Today's Tasks",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: userTasks.length,
                      itemBuilder: (context, index) {
                        return TaskesCategory(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const TaskDetailsScreen(),
                                settings: RouteSettings(
                                  arguments: userTasks[index],
                                ),
                              ),
                            );
                          },
                          task: userTasks[index],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
