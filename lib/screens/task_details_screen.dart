import 'package:day_task/constants.dart';
import 'package:day_task/cubits/project%20cubit/projects%20cubit/projects_cubit.dart';
import 'package:day_task/cubits/project%20cubit/projects%20cubit/projects_state.dart';
import 'package:day_task/cubits/task%20cubit/add%20completed%20tasks%20cubit/add_completed_tasks_cubit.dart';
import 'package:day_task/cubits/task%20cubit/add%20completed%20tasks%20cubit/add_completed_tasks_state.dart'
    show AddCompletedTasksSuccess, AddCompletedTasksState;
import 'package:day_task/cubits/task%20cubit/remove%20completed%20tasks%20cubit/remove_completed_tasks_cubit.dart';
import 'package:day_task/cubits/task%20cubit/remove%20completed%20tasks%20cubit/remove_completed_tasks_state.dart';
import 'package:day_task/model/task_model.dart';
import 'package:day_task/widgets/custom_app_bar.dart';
import 'package:day_task/widgets/task_details_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskDetailsScreen extends StatefulWidget {
  const TaskDetailsScreen({super.key});

  @override
  State<TaskDetailsScreen> createState() => _TaskDetailsScreenState();
}

class _TaskDetailsScreenState extends State<TaskDetailsScreen> {
  TaskModel? task;
  late int projectId;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    projectId = ModalRoute.of(context)!.settings.arguments as int;
    BlocProvider.of<ProjectsCubit>(context).fetchAllProjects();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProjectsCubit, ProjectsState>(
      builder: (context, state) {
        final projects = BlocProvider.of<ProjectsCubit>(context).projects;

        final project = projects![projectId];

        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => AddCompletedTasksCubit(
                BlocProvider.of<ProjectsCubit>(context),
              ),
            ),
            BlocProvider(
              create: (context) => RemoveCompletedTasksCubit(
                BlocProvider.of<ProjectsCubit>(context),
              ),
            ),
          ],

          child: MultiBlocListener(
            listeners: [
              BlocListener<AddCompletedTasksCubit, AddCompletedTasksState>(
                listener: (context, state) {
                  if (state is AddCompletedTasksSuccess) {
                    BlocProvider.of<ProjectsCubit>(context).fetchAllProjects();
                  }
                },
              ),
              BlocListener<
                RemoveCompletedTasksCubit,
                RemoveCompletedTasksState
              >(
                listener: (context, state) {
                  if (state is RemoveCompletedTasksSuccess) {
                    BlocProvider.of<ProjectsCubit>(context).fetchAllProjects();
                  }
                },
              ),
            ],
            child: Scaffold(
              appBar: CustomAppBar(
                title: 'Task Details',
                sufImage: "assets/images/edit.svg",
              ),

              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    SizedBox(height: 30),
                    Text(
                      task!.title,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "PilatExtended",
                        fontSize: 21,
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Row(
                        children: [
                          TaskDetailsRow(
                            iconImage: 'assets/images/calendarremove.svg',
                            title: 'Due Date',
                            content: task!.date,
                          ),
                          Spacer(flex: 2),
                          TaskDetailsRow(
                            iconImage: 'assets/images/profile2user.svg',
                            title: 'Task members',
                            project: project,
                          ),
                          Spacer(flex: 1),
                        ],
                      ),
                    ),
                    Text(
                      "Task Details",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    SizedBox(height: 10),
                    Flexible(
                      child: SingleChildScrollView(
                        child: Text(
                          project.details,
                          style: TextStyle(
                            color: kLabelTextColor,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
