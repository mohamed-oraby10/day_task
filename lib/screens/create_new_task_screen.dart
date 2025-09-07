import 'package:day_task/widgets/add_team_member.dart';
import 'package:day_task/widgets/custom_app_bar.dart';
import 'package:day_task/widgets/custom_square.dart';
import 'package:day_task/widgets/custom_task_date_and_time.dart';
import 'package:day_task/widgets/main_button.dart';
import 'package:day_task/widgets/text_input.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CreateNewTask extends StatefulWidget {
  const CreateNewTask({super.key});

  @override
  State<CreateNewTask> createState() => _CreateNewTaskState();
}

class _CreateNewTaskState extends State<CreateNewTask> {
  var selectedTime = TimeOfDay.now();
  DateTime? selectedDate;
  String? title, details;
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Create New Task"),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Task Title',
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
                  'Task Details',
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
                    
                    CustomTaskDateAndTime(text: selectedTime.format(context)),
                    SizedBox(width: 7),
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
                          ? DateFormat('dd/MM/yyyy').format(DateTime.now())
                          : DateFormat('dd/MM/yyyy').format(selectedDate!),
                    ),
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
                MainButton(
                  textButton: 'Create',
                  onPress: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
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
    );
  }
}
