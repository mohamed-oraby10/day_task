import 'package:day_task/constants.dart';
import 'package:day_task/cubits/project cubit/projects cubit/projects_cubit.dart';
import 'package:day_task/cubits/project cubit/projects cubit/projects_state.dart';
import 'package:day_task/enum.dart';
import 'package:day_task/model/project_model.dart';
import 'package:day_task/provider/user_provider.dart';
import 'package:day_task/screens/profile_screen.dart';
import 'package:day_task/screens/project_details_screen.dart';
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
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ProjectsCubit>(context).fetchAllProjects();
  }

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<UserProvider>(context);
    final firstLetter = user.name?[0].toUpperCase() ?? '?';

    return BlocBuilder<ProjectsCubit, ProjectsState>(
      builder: (context, state) {
        List<ProjectModel> projects =
            BlocProvider.of<ProjectsCubit>(context).projects ?? [];
        final completedProjects = projects
            .where((p) => p.progressPercent == 1)
            .toList();
        final ongoingProjects = projects
            .where((p) => p.progressPercent < 1)
            .toList();
        return Scaffold(
          bottomNavigationBar: const CustomBottomNavigationBar(
            selectedMenu: MenuState.home,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Welcome Back!',
                            style: TextStyle(color: kMainColor, fontSize: 14),
                          ),
                          Text(
                            user.name ?? "",
                            style: const TextStyle(
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
                              builder: (context) => const ProfileScreen(),
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
                                  style: const TextStyle(
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
                const SizedBox(height: 20),
                const HomeSearchBar(),
                const SizedBox(height: 20),
                const CustomRow(title: "Completed tasks"),
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: completedProjects.length,
                    itemBuilder: (context, index) {
                      return CompletedTasksCrad(
                        project: completedProjects[index],
                        onTap: () {
                          final projectKey = completedProjects[index].key;
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProjectDetailsScreen(),
                              settings: RouteSettings(
                                arguments: projectKey as int,
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                const CustomRow(title: "Ongoing Projects"),
                Expanded(
                  child: ListView.builder(
                    itemCount: ongoingProjects.length,
                    itemBuilder: (context, index) {
                      return OngoingTasks(
                        project: ongoingProjects[index],
                        onTap: () {
                          final projectKey = ongoingProjects[index].key;
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProjectDetailsScreen(),
                              settings: RouteSettings(
                                arguments: projectKey as int,
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
