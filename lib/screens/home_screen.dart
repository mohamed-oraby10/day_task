import 'package:day_task/constants.dart';
import 'package:day_task/cubits/project cubit/projects cubit/projects_cubit.dart';
import 'package:day_task/cubits/project cubit/projects cubit/projects_state.dart';
import 'package:day_task/enum.dart';
import 'package:day_task/model/project_model.dart';
import 'package:day_task/provider/user_provider.dart';
import 'package:day_task/widgets/all_completed_projects.dart';
import 'package:day_task/widgets/all_ongoing_projects.dart';
import 'package:day_task/service/presence_service.dart';
import 'package:day_task/utilitis/app_routes.dart';
import 'package:day_task/widgets/custom_list_view.dart';
import 'package:day_task/widgets/custom_row.dart';
import 'package:day_task/widgets/completed_tasks_card.dart';
import 'package:day_task/widgets/custom_sized_box.dart';
import 'package:day_task/widgets/home_search_bar.dart';
import 'package:day_task/utilitis/custom_bottom_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 45.h),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Welcome Back!',
                              style: TextStyle(
                                color: kMainColor,
                                fontSize: 12.sp,
                              ),
                            ),
                            Text(
                              user.userModel?.name ?? "",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22.sp,
                                fontFamily: "PilatExtended",
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 80.h,
                        width: 50.w,
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
                  SizedBox(height: 20.h),
                  HomeSearchBar(
                    onChanged: (value) {
                      setState(() {
                        searchQuery = value;
                      });
                    },
                  ),
                  SizedBox(height: 20.h),
                  searchQuery.isNotEmpty
                      ? projects.isEmpty
                            ? Center(
                                child: Text(
                                  'No matching projects found.',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.sp,
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
                  completedProjects.isNotEmpty
                      ? SizedBox(
                          height: 200.h,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: completedProjects.length,
                            itemBuilder: (context, index) {
                              return CompletedTasksCrad(
                                project: completedProjects[index],
                                onTap: () {
                                  final projectKey =
                                      completedProjects[index].key;
                                  Navigator.pushNamed(
                                    context,
                                    AppRoutes.projectDetailsRoute,
                                    arguments: projectKey as int,
                                  );
                                },
                              );
                            },
                          ),
                        )
                      : CustomSizedBox(messageText: 'No completed tasks yet.'),
                  SizedBox(height: 20.h),
                  CustomRow(
                    title: "Ongoing Projects",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return AllOngoingProjects(
                              projects: ongoingProjects,
                            );
                          },
                        ),
                      );
                    },
                  ),
                  ongoingProjects.isNotEmpty
                      ? CustomListView(selectedList: ongoingProjects)
                      : CustomSizedBox(messageText: 'No ongoing tasks yet.'),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
