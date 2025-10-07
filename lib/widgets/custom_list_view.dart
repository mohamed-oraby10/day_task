import 'package:day_task/model/project_model.dart';
import 'package:day_task/screens/project_details_screen.dart';
import 'package:day_task/widgets/ongoing_tasks_caregory.dart';
import 'package:flutter/material.dart';

class CustomListView extends StatelessWidget {
  const CustomListView({super.key, required this.selectedList});
  final List<ProjectModel> selectedList;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: selectedList.length,
      itemBuilder: (context, index) {
        return OngoingTasks(
          project: selectedList[index],
          onTap: () {
            final projectKey = selectedList[index].key;
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProjectDetailsScreen(),
                settings: RouteSettings(arguments: projectKey as int),
              ),
            );
          },
        );
      },
    );
  }
}
