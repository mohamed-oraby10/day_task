// import 'package:day_task/model/task_model.dart';
// import 'package:day_task/model/team_member_model.dart';
// import 'package:hive_flutter/adapters.dart';

// part 'project_model.g.dart';

// @HiveType(typeId: 1)
// class ProjectModel extends HiveObject {
//   @HiveField(0)
//   final String title;

//   @HiveField(1)
//   final String details;

//   @HiveField(2)
//   final String date;

//   @HiveField(3)
//   final List<TeamMemberModel> projectTeam;

//   @HiveField(4)
//   double progressPercent = 0;

//   @HiveField(5)
//   List<TaskModel> projectTasks;

//   @HiveField(6)
//   List<TaskModel> completedTasks = [];

//   @HiveField(7)
//   final String userId;

//   @HiveField(8)
//   final List<String> teamMemberIds;

//   ProjectModel({
//     required this.teamMemberIds,
//     required this.userId,
//     required this.progressPercent,
//     required this.title,
//     required this.details,
//     required this.date,
//     required this.projectTeam,
//     required this.projectTasks,
//     required this.completedTasks,
//   });
// }






import 'package:day_task/model/task_model.dart';
import 'package:day_task/model/team_member_model.dart';
import 'package:hive/hive.dart';
part 'project_model.g.dart';

@HiveType(typeId: 1)
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
  double progressPercent;

  @HiveField(5)
  List<TaskModel> projectTasks;

  @HiveField(6)
  List<TaskModel> completedTasks;

  @HiveField(7)
  final String userId;

  @HiveField(8)
  final List<String> teamMemberIds;

  ProjectModel({
    required this.title,
    required this.details,
    required this.date,
    required this.projectTeam,
    this.progressPercent = 0,
    required this.projectTasks,
    required this.completedTasks,
    required this.userId,
    required this.teamMemberIds,
  });

  /// 👇 لتفادي null وقت القراءة
  factory ProjectModel.safe({
    String? title,
    String? details,
    String? date,
    List<TeamMemberModel>? projectTeam,
    double? progressPercent,
    List<TaskModel>? projectTasks,
    List<TaskModel>? completedTasks,
    String? userId,
    List<String>? teamMemberIds,
  }) {
    return ProjectModel(
      title: title ?? '',
      details: details ?? '',
      date: date ?? '',
      projectTeam: projectTeam ?? [],
      progressPercent: progressPercent ?? 0,
      projectTasks: projectTasks ?? [],
      completedTasks: completedTasks ?? [],
      userId: userId ?? '',
      teamMemberIds: teamMemberIds ?? [],
    );
  }
}
