import 'package:day_task/constants.dart';
import 'package:day_task/cubits/project cubit/projects cubit/projects_cubit.dart';
import 'package:day_task/cubits/project cubit/projects cubit/projects_state.dart';
import 'package:day_task/enum.dart';
import 'package:day_task/model/project_model.dart';
import 'package:day_task/provider/user_provider.dart';
import 'package:day_task/screens/all_completed_projects_screen.dart';
import 'package:day_task/screens/all_ongoing_projects_screen.dart';
import 'package:day_task/screens/project_details_screen.dart';
import 'package:day_task/service/presence_service.dart';
import 'package:day_task/utilitis/app_routes.dart';
import 'package:day_task/widgets/custom_list_view.dart';
import 'package:day_task/widgets/custom_row.dart';
import 'package:day_task/widgets/completed_tasks_card.dart';
import 'package:day_task/widgets/home_search_bar.dart';
import 'package:day_task/utilitis/custom_bottom_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String searchQuery = '';
  late PresenceService presenceService;

  @override
  void initState() {
    super.initState();
    final user = FirebaseAuth.instance.currentUser!;
    presenceService = PresenceService(user.uid);
    presenceService.start();
    BlocProvider.of<ProjectsCubit>(context).fetchAllProjects();
  }

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<UserProvider>(context);
    final firstLetter = user.userModel?.name[0].toUpperCase() ?? '?';

    return BlocBuilder<ProjectsCubit, ProjectsState>(
      builder: (context, state) {
        List<ProjectModel> allProjects =
            BlocProvider.of<ProjectsCubit>(context).projects ?? [];
        List<ProjectModel> projects = allProjects
            .where(
              (p) => p.title.toLowerCase().contains(searchQuery.toLowerCase()),
            )
            .toList();
        final completedProjects = allProjects
            .where((p) => p.progressPercent == 1)
            .toList();
        final ongoingProjects = allProjects
            .where((p) => p.progressPercent < 1)
            .toList();
        return Scaffold(
          resizeToAvoidBottomInset: true,
          bottomNavigationBar: const CustomBottomNavigationBar(
            selectedMenu: MenuState.home,
          ),
          body: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,

            child: Padding(
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
                              user.userModel?.name ?? "",
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
                            Navigator.pushNamed(
                              context,
                              AppRoutes.profileRoute,
                            );
                          },
                          icon: CircleAvatar(
                            radius: 20,
                            backgroundColor: kMainColor,
                            backgroundImage: user.userModel?.image != null
                                ? NetworkImage(user.userModel!.image!)
                                : null,
                            child: user.userModel?.image == null
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
                  HomeSearchBar(
                    onChanged: (value) {
                      setState(() {
                        searchQuery = value;
                      });
                    },
                  ),
                  const SizedBox(height: 20),
                  searchQuery.isNotEmpty
                      ? projects.isEmpty
                            ? Center(
                                child: Text(
                                  'No matching projects found.',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                              )
                            : CustomListView(selectedList: projects)
                      : CustomRow(
                          title: "Completed tasks",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return AllCompletedProjects(
                                    projects: completedProjects,
                                  );
                                },
                              ),
                            );
                          },
                        ),
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
                  CustomRow(
                    title: "Ongoing Projects",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return AllOngoingProjectsScreen(
                              projects: ongoingProjects,
                            );
                          },
                        ),
                      );
                    },
                  ),
                  CustomListView(selectedList: ongoingProjects),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
