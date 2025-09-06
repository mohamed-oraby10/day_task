import 'package:hive/hive.dart';
part 'task_model.g.dart';

@HiveType(typeId: 0)
class TaskModel extends HiveObject {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String details;
  @HiveField(2)
  final String time;
  @HiveField(3)
  final String date;
  @HiveField(4)
  final List<String> teamMembers;

  TaskModel({required this.title, required this.details, required this.time, required this.date, required this.teamMembers});
}
