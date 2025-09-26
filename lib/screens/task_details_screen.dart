import 'package:day_task/constants.dart';
import 'package:day_task/cubits/project%20cubit/projects%20cubit/projects_cubit.dart';
import 'package:day_task/cubits/project%20cubit/projects%20cubit/projects_state.dart';
import 'package:day_task/cubits/task%20cubit/add%20completed%20tasks%20cubit/add_completed_tasks_cubit.dart';
import 'package:day_task/cubits/task%20cubit/add%20completed%20tasks%20cubit/add_completed_tasks_state.dart';
import 'package:day_task/cubits/task%20cubit/remove%20completed%20tasks%20cubit/remove_completed_tasks_cubit.dart';
import 'package:day_task/cubits/task%20cubit/remove%20completed%20tasks%20cubit/remove_completed_tasks_state.dart';
import 'package:day_task/widgets/add_task_button.dart';
import 'package:day_task/widgets/custom_app_bar.dart';
import 'package:day_task/widgets/cutom_tasks.dart';
import 'package:day_task/widgets/percent_circular.dart';
import 'package:day_task/widgets/task_details_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskDetailsScreen extends StatefulWidget {
  const TaskDetailsScreen({super.key});

  @override
  State<TaskDetailsScreen> createState() => _TaskDetailsScreenState();
}

class _TaskDetailsScreenState extends State<TaskDetailsScreen> {
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
            BlocProvider(create: (context) => AddCompletedTasksCubit(BlocProvider.of<ProjectsCubit>(context))),
            BlocProvider(create: (context) => RemoveCompletedTasksCubit(BlocProvider.of<ProjectsCubit>(context))),
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
      BlocListener<RemoveCompletedTasksCubit, RemoveCompletedTasksState>(
        listener: (context, state) {
          if (state is RemoveCompletedTasksSuccess) {
            BlocProvider.of<ProjectsCubit>(context).fetchAllProjects();
          }
        },
      ),
    ],
            child: Scaffold(
              bottomNavigationBar: AddTaskButton(projectKey: projectId),
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
                      project.title,
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
                            content: project.date,
                          ),
                          Spacer(flex: 2),
                          TaskDetailsRow(
                            iconImage: 'assets/images/profile2user.svg',
                            title: 'Project Team',
                            project: project,
                          ),
                          Spacer(flex: 1),
                        ],
                      ),
                    ),
                    Text(
                      "Project Details",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    SizedBox(height: 10),
                    Flexible(
                      child: SingleChildScrollView(
                        child: Text(
                          project.details,
                          style: TextStyle(color: kLabelTextColor, fontSize: 16),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: [
                          Text(
                            "Project Progress",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          Spacer(),
                          PercentCircular(
                            backgroundColor: kFillTextFormColor,
                            percent: project.progressPercent,
                          ),
                        ],
                      ),
                    ),
                    Text(
                      "All Tasks",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    SizedBox(height: 15),
                    Expanded(
                      child: ListView.builder(
                        itemCount: project.projectTasks.length,
                        itemBuilder: (context, index) {
                          final task = project.projectTasks[index];
                          final isCompletedTask = project.completedTasks.any(
                            (t) => t.details == task.details,
                          );
                          return CutomTasks(
                            task: task,
                            isChecked: isCompletedTask,
                            onCheckChanged: (value) {
                          
                                if (value == true) {
                                  BlocProvider.of<AddCompletedTasksCubit>(
                                    context,
                                  ).addCompletedTask(task, projectId);
                                } else {
                                  BlocProvider.of<RemoveCompletedTasksCubit>(
                                    context,
                                  ).removeCompletedTask(task, projectId);
                                }
                               
                            },
                          );
                        },
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
