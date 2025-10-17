import 'package:day_task/constants.dart';
import 'package:day_task/cubits/project cubit/add project cubit/add_project_cubit.dart';
import 'package:day_task/cubits/project cubit/add project cubit/add_project_state.dart';
import 'package:day_task/cubits/project cubit/projects cubit/projects_cubit.dart';
import 'package:day_task/helper/show_user_dialog.dart';
import 'package:day_task/model/project_model.dart';
import 'package:day_task/model/team_member_model.dart';
import 'package:day_task/widgets/add_team_member.dart';
import 'package:day_task/widgets/custom_app_bar.dart';
import 'package:day_task/widgets/custom_square.dart';
import 'package:day_task/widgets/custom_task_date_and_time.dart';
import 'package:day_task/widgets/main_button.dart';
import 'package:day_task/widgets/text_input.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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

  int? projectId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddProjectCubit(),
      child: BlocConsumer<AddProjectCubit, AddProjectState>(
        listener: (context, state) {
          if (state is AddProjectFailure) {}

          if (state is AddProjectSuccess) {
            BlocProvider.of<ProjectsCubit>(context).fetchAllProjects();
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
            progressIndicator: CircularProgressIndicator(color: kMainColor),
            inAsyncCall: state is AddProjectLoading ? true : false,
            child: Scaffold(
              appBar: CustomAppBar(title: "Create New Project"),
              body: Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Project Title',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.sp,
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.h),
                          child: TextInput(
                            hint: "Title",
                            onSaved: (value) async {
                              title = value;
                            },
                          ),
                        ),
                        SizedBox(height: 15.h),
                        Text(
                          'Details',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.sp,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.h),
                          child: TextInput(
                            hint: "Details",
                            maxLines: 3,
                            onSaved: (value) async {
                              details = value;
                            },
                          ),
                        ),
                        SizedBox(height: 15.h),
                        Text(
                          'Add team members',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.sp,
                          ),
                        ),
                        SizedBox(height: 12.h),
                        Row(
                          children: [
                            SizedBox(
                              height: 41.h,
                              width: 320.w,
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
                            SizedBox(width: 25.w),
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

                        SizedBox(height: 30.h),
                        Text(
                          'Date',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.sp,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Row(
                          children: [
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
                        SizedBox(height: 60.h),
                        MainButton(
                          textButton: 'Create',
                          onPress: () async {
                            if (formKey.currentState!.validate()) {
                              final currentUserId =
                                  FirebaseAuth.instance.currentUser!.uid;

                              formKey.currentState!.save();
                              final memberIds = [
                                currentUserId,
                                ...teamMembers.map((m) => m.id),
                              ];
                              var projectModel = ProjectModel(
                                title: title!,
                                details: details!,
                                date: selectedDate == null
                                    ? DateFormat(
                                        'd MMMM',
                                      ).format(DateTime.now())
                                    : DateFormat(
                                        'd MMMM',
                                      ).format(selectedDate!),
                                projectTeam: teamMembers,
                                progressPercent: 0,
                                projectTasks: [],
                                completedTasks: [],
                                teamMemberIds: memberIds,
                                userId: currentUserId,
                              );

                              final cubit = BlocProvider.of<AddProjectCubit>(
                                context,
                              );
                              await cubit.addProject(projectModel);
                              setState(() {
                                projectId = projectModel.key;
                              });
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
