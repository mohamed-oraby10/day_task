import 'package:day_task/model/project_model.dart';
import 'package:day_task/widgets/completed_tasks_card.dart';
import 'package:day_task/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class AllCompletedProjects extends StatelessWidget {
  const AllCompletedProjects({super.key, required this.projects});
  final List<ProjectModel> projects;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'All completed projects'),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: GridView.builder(
          itemCount: projects.length,
          itemBuilder: (context, index) {
            final project = projects[index];
            return CompletedTasksCrad(project: project);
          },
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
        ),
      ),
    );
  }
}
