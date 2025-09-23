import 'package:day_task/constants.dart';
import 'package:day_task/cubits/task cubit/add task cubit/add_task_cubit.dart';
import 'package:day_task/cubits/task cubit/add task cubit/add_task_state.dart';
import 'package:day_task/cubits/task cubit/tasks cubit/tasks_cubit.dart';
import 'package:day_task/helper/show_user_dialog.dart';
import 'package:day_task/model/task_model.dart';
import 'package:day_task/model/team_member_model.dart';
import 'package:day_task/widgets/add_team_member.dart';
import 'package:day_task/widgets/custom_app_bar.dart';
import 'package:day_task/widgets/custom_square.dart';
import 'package:day_task/widgets/custom_task_date_and_time.dart';
import 'package:day_task/widgets/main_button.dart';
import 'package:day_task/widgets/text_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class CreateNewTask extends StatefulWidget {
  const CreateNewTask({super.key});

  @override
  State<CreateNewTask> createState() => _CreateNewTaskState();
}

class _CreateNewTaskState extends State<CreateNewTask> {
  List<TeamMemberModel> teamMembers = [];
  var selectedTime = TimeOfDay.now();
  DateTime? selectedDate;
  String? title, details;
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments;
    final int? projectKey = args is int ? args : null;

    if (projectKey == null) {
      return const Scaffold(body: Center(child: Text("⚠ No Project Selected")));
    }

    return BlocProvider(
      create: (context) => AddTaskCubit(),
      child: BlocConsumer<AddTaskCubit, AddTaskState>(
        listener: (context, state) {
          if (state is AddTaskSuccess) {
            BlocProvider.of<TasksCubit>(context).featchAllTasks(projectKey);
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
            progressIndicator: const CircularProgressIndicator(
              color: kMainColor,
            ),
            inAsyncCall: state is AddTaskLoading,
            child: Scaffold(
              appBar: const CustomAppBar(title: "Create New Task"),
              body: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20,
                ),
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    autovalidateMode: autovalidateMode,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Task Title',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: TextInput(
                            hint: "Title",
                            onSaved: (value) => title = value,
                          ),
                        ),

                        const SizedBox(height: 15),

                        const Text(
                          'Task Details',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: TextInput(
                            hint: "Details",
                            maxLines: 3,
                            onSaved: (value) => details = value,
                          ),
                        ),

                        const SizedBox(height: 15),

                        const Text(
                          'Add team members',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            SizedBox(
                              height: 45,
                              width: 300,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: teamMembers.length,
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
                            const SizedBox(width: 25),
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

                        const SizedBox(height: 25),

                        const Text(
                          'Time & Date',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        const SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CustomSquare(
                              icon: "assets/images/clock.svg",
                              onPress: () async {
                                TimeOfDay? timePicked = await showTimePicker(
                                  context: context,
                                  initialTime: selectedTime,
                                );
                                if (timePicked != null) {
                                  setState(() {
                                    selectedTime = timePicked;
                                  });
                                }
                              },
                            ),
                            CustomTaskDateAndTime(
                              text: selectedTime.format(context),
                            ),
                            const SizedBox(width: 7),
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

                        const SizedBox(height: 50),

                        MainButton(
                          textButton: 'Create',
                          onPress: () {
                            if (formKey.currentState!.validate()) {
                              formKey.currentState!.save();

                              var task = TaskModel(
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
                              ).addTask(task, projectKey);
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
