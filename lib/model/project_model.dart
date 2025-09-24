import 'package:day_task/model/task_model.dart';
import 'package:day_task/model/team_member_model.dart';
import 'package:hive_flutter/adapters.dart';

part 'project_model.g.dart';

@HiveType(typeId: 2)
class ProjectModel extends HiveObject {
  @HiveField(0)
  final String title;

  @HiveField(1)
  final String details;

  @HiveField(2)
  final String date;

  @HiveField(3)
  final List<TeamMemberModel> projectTeam;

  @HiveField(4)
  double progressPercent = 0;

  @HiveField(5)
  List<TaskModel> projectTasks;

  @HiveField(6)
  List<TaskModel> completedTasks = [];

  ProjectModel({
    required this.progressPercent,
    required this.title,
    required this.details,
    required this.date,
    required this.projectTeam,
    required this.projectTasks,
    required this.completedTasks
  });
}
