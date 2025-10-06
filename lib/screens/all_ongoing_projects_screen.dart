import 'package:day_task/model/project_model.dart';
import 'package:day_task/widgets/custom_app_bar.dart';
import 'package:day_task/widgets/ongoing_tasks_caregory.dart';
import 'package:flutter/material.dart';

class AllOngoingProjectsScreen extends StatelessWidget {
  const AllOngoingProjectsScreen({super.key, required this.projects});
  final List<ProjectModel> projects;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'All ongoing projects'),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: ListView.builder(
          itemCount: projects.length,
          itemBuilder: (context, index) {
            final project = projects[index];
            return OngoingTasks(project: project);
          },
        ),
      ),
    );
  }
}
