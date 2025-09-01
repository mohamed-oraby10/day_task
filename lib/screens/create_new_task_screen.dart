import 'package:day_task/widgets/add_team_member.dart';
import 'package:day_task/widgets/custom_app_bar.dart';
import 'package:day_task/widgets/custom_square.dart';
import 'package:day_task/widgets/custom_task_date_and_time.dart';
import 'package:day_task/widgets/main_button.dart';
import 'package:day_task/widgets/text_input.dart';
import 'package:flutter/material.dart';

class CreateNewTask extends StatelessWidget {
  const CreateNewTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Create New Task"),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Task Title',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: TextInput(hint: "Title"),
              ),
              SizedBox(height: 15),
              const Text(
                'Task Details',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: TextInput(hint: "Details", maxLines: 3),
              ),
              SizedBox(height: 15),
              const Text(
                'Add team members',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              SizedBox(height: 12),
              Row(
                children: [
                  AddTeamMember(),
                  SizedBox(width: 8),
                  AddTeamMember(),
                  SizedBox(width: 8),
                  Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: CustomSquare(icon: "assets/images/addsquare.svg"),
                  ),
                ],
              ),
              SizedBox(height: 25),
              Text(
                'Time & Date',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomSquare(icon: "assets/images/clock.svg"),
                  CustomTaskDateAndTime(text: '10:30 AM'),
                  SizedBox(width: 7),
                  CustomSquare(icon: "assets/images/calendar.svg"),
                  CustomTaskDateAndTime(text: '19/7/2025'),
                ],
              ),
              const Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 40),
                  child: Text(
                    'Add New',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
              MainButton(textButton: 'Create', onPress: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
