import 'package:day_task/constants.dart';
import 'package:day_task/cubits/project%20cubit/projects%20cubit/projects_cubit.dart';
import 'package:day_task/cubits/task%20cubit/tasks%20cubit/tasks_cubit.dart';
import 'package:day_task/cubits/task%20cubit/tasks%20cubit/tasks_state.dart';
import 'package:day_task/enum.dart';
import 'package:day_task/model/task_model.dart';
import 'package:day_task/provider/user_provider.dart';
import 'package:day_task/screens/profile_screen.dart';
import 'package:day_task/widgets/custom_row.dart';
import 'package:day_task/widgets/completed_tasks_card.dart';
import 'package:day_task/widgets/home_search_bar.dart';
import 'package:day_task/widgets/ongoing_tasks_caregory.dart';
import 'package:day_task/utilitis/custom_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TaskModel? task;

  @override
  void initState() {
    BlocProvider.of<ProjectsCubit>(context).fetchAllProjects();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<UserProvider>(context);
    final firstLetter = user.name?[0].toUpperCase() ?? '?';

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
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome Back!',
                        style: TextStyle(color: kMainColor, fontSize: 14),
                      ),
                      Text(
                        user.name ?? "",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: "PilatExtended",
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: 80,
                  width: 50,
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return ProfileScreen();
                          },
                        ),
                      );
                    },
                    icon: CircleAvatar(
                      radius: 20,
                      backgroundColor: kMainColor,
                      backgroundImage: user.image != null
                          ? NetworkImage(user.image!)
                          : null,

                      child: user.image == null
                          ? Text(
                              firstLetter,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                              ),
                            )
                          : null,
                    ),
                  ),
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
                    taskColor: kMainColor,
                    fontColor: Colors.black,
                    taskImage: 'assets/images/Rectangle 12.png',
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            CustomRow(title: "Ongoing Projects"),
            BlocBuilder<TasksCubit, TasksState>(
              builder: (context, state) {
                List<TaskModel> tasks = BlocProvider.of<TasksCubit>(
                  context,
                ).tasks!;
                return Expanded(
                  child: ListView.builder(
                    itemCount: tasks.length,
                    itemBuilder: (context, index) {
                      return OngoingTasks(
                        task: tasks[index] ,
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
