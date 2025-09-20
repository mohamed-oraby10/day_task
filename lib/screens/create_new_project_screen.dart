import 'package:day_task/constants.dart';
import 'package:day_task/cubits/add%20task%20cubit/add_task_cubit.dart';
import 'package:day_task/cubits/add%20task%20cubit/add_task_state.dart';
import 'package:day_task/cubits/tasks%20cubit/tasks_cubit.dart';
import 'package:day_task/cubits/tasks%20cubit/tasks_state.dart';
import 'package:day_task/helper/show_user_dialog.dart';
import 'package:day_task/model/task_model.dart';
import 'package:day_task/model/team_member_model.dart';
import 'package:day_task/utilitis/app_routes.dart';
import 'package:day_task/widgets/add_team_member.dart';
import 'package:day_task/widgets/custom_app_bar.dart';
import 'package:day_task/widgets/custom_square.dart';
import 'package:day_task/widgets/custom_task_date_and_time.dart';
import 'package:day_task/widgets/cutom_tasks.dart';
import 'package:day_task/widgets/main_button.dart';
import 'package:day_task/widgets/text_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class CreateNewProjectScreen extends StatefulWidget {
  const CreateNewProjectScreen({super.key});

  @override
  State<CreateNewProjectScreen> createState() => _CreateNewProjectScreenState();
}

class _CreateNewProjectScreenState extends State<CreateNewProjectScreen> {
  List<TeamMemberModel> teamMembers = [];
  var selectedTime = TimeOfDay.now();
  DateTime? selectedDate;
  String? title, details;
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  TaskModel? task;
  @override
  void initState() {
    BlocProvider.of<TasksCubit>(context).featchAllTasks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddTaskCubit(),
      child: BlocConsumer<AddTaskCubit, AddTaskState>(
        listener: (context, state) {
          if (state is AddTaskFailure) {}

          if (state is AddTaskSuccess) {
            BlocProvider.of<TasksCubit>(context).featchAllTasks();
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
            progressIndicator: CircularProgressIndicator(color: kMainColor),
            inAsyncCall: state is AddTaskLoading ? true : false,
            child: Scaffold(
              appBar: CustomAppBar(title: "Create New Project"),
              body: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20,
                ),
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Project Title',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: TextInput(
                            hint: "Title",
                            onSaved: (value) async {
                              title = value;
                            },
                          ),
                        ),
                        SizedBox(height: 15),
                        const Text(
                          'Details',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: TextInput(
                            hint: "Details",
                            maxLines: 3,
                            onSaved: (value) async {
                              details = value;
                            },
                          ),
                        ),
                        SizedBox(height: 15),
                        const Text(
                          'Add team members',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        SizedBox(height: 12),
                        Row(
                          children: [
                            SizedBox(
                              height: 45,
                              width: 300,
                              child: ListView.builder(
                                itemCount: teamMembers.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  final member = teamMembers[index];
                                  return AddTeamMember(
                                    memberName: member.name,
                                    memberImage: member.image,
                                    onPress: () {
                                      setState(() {
                                        teamMembers.removeAt(index);
                                      });
                                    },
                                  );
                                },
                              ),
                            ),
                            SizedBox(width: 25),
                            CustomSquare(
                              icon: "assets/images/addsquare.svg",
                              onPress: () async {
                                await showUsersDialog(context, (users) {
                                  setState(() {
                                    for (var user in users) {
                                      if (!teamMembers.any(
                                        (m) => m.name == user.name,
                                      )) {
                                        teamMembers.add(user);
                                      }
                                    }
                                  });
                                });
                              },
                            ),
                          ],
                        ),

                        SizedBox(height: 10),
                        Text(
                          'Date',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        SizedBox(height: 8),
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            // CustomSquare(
                            //   icon: "assets/images/clock.svg",
                            //   onPress: () async {
                            //     TimeOfDay? timePicked = await showTimePicker(
                            //       context: context,
                            //       initialTime: selectedTime,
                            //     );
                            //     if (timePicked != null) {
                            //       setState(() {
                            //         selectedTime = timePicked;
                            //       });
                            //     }
                            //   },
                            // ),
                            // CustomTaskDateAndTime(
                            //   text: selectedTime.format(context),
                            // ),
                            // SizedBox(width: 7),
                            CustomSquare(
                              icon: "assets/images/calendar.svg",
                              onPress: () async {
                                DateTime? picked = await showDatePicker(
                                  context: context,
                                  initialDate: selectedDate ?? DateTime.now(),
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(2300),
                                );
                                if (picked != null) {
                                  setState(() {
                                    selectedDate = picked;
                                  });
                                }
                              },
                            ),
                            CustomTaskDateAndTime(
                              text: selectedDate == null
                                  ? DateFormat(
                                      'dd/MM/yyyy',
                                    ).format(DateTime.now())
                                  : DateFormat(
                                      'dd/MM/yyyy',
                                    ).format(selectedDate!),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: TextButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                AppRoutes.createTaskRoute,
                              );
                            },
                            child: Text(
                              'Add task',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                        BlocBuilder<TasksCubit, TasksState>(
                          builder: (context, state) {
                            List<TaskModel> tasks = BlocProvider.of<TasksCubit>(
                              context,
                            ).tasks!;
                            return SizedBox(
                              height: 160,
                              child: ListView.builder(
                                itemCount: tasks.length,
                                itemBuilder: (context, index) {
                                  return CutomTasks(
                                    task: tasks[index],
                                    onCheckChanged: (bool? value) {},
                                    isChecked: true,
                                  );
                                },
                              ),
                            );
                          },
                        ),
                        SizedBox(height: 20),
                        MainButton(
                          textButton: 'Create',
                          onPress: () {
                            if (formKey.currentState!.validate()) {
                              formKey.currentState!.save();
                              var taskModel = TaskModel(
                                title: title!,
                                details: details!,
                                time: selectedTime.format(context),
                                date: selectedDate == null
                                    ? DateFormat(
                                        'd MMMM',
                                      ).format(DateTime.now())
                                    : DateFormat(
                                        'd MMMM',
                                      ).format(selectedDate!),
                                teamMembers: teamMembers,
                              );
                              BlocProvider.of<AddTaskCubit>(
                                context,
                              ).addTask(taskModel);
                            } else {
                              autovalidateMode = AutovalidateMode.always;
                              setState(() {});
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
