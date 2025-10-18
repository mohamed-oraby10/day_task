import 'package:day_task/constants.dart';
import 'package:day_task/cubits/task cubit/tasks of today cubit/tasks_of_today_state.dart';
import 'package:day_task/model/project_model.dart';
import 'package:day_task/model/task_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

class TasksOfTodayCubit extends Cubit<TasksOfTodayState> {
  TasksOfTodayCubit() : super(TasksOfTodayInitial());

  List<TaskModel> tasks = [];

  void fetchAllTasksOfToday() {
    try {
      final projectBox = Hive.box<ProjectModel>(kProjectBox);

      List<TaskModel> allTasks = [];
      for (var project in projectBox.values) {
        allTasks.addAll(project.projectTasks);
      }
      final todayFormatted = DateFormat('d MMM').format(DateTime.now());
      tasks = allTasks.where((t) => t.date == todayFormatted).toList();

      emit(TasksOfTodaySuccess());
    } catch (e) {
      emit(TasksOfTodayFailure(e.toString()));
    }
  }
}
