import 'package:day_task/constants.dart';
import 'package:day_task/cubits/task%20cubit/tasks%20cubit/tasks_state.dart';
import 'package:day_task/model/project_model.dart';
import 'package:day_task/model/task_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

class TasksCubit extends Cubit<TasksState> {
  TasksCubit() : super(TasksInitial());
  List<TaskModel>? tasks;

  featchAllTasks(int projectKey) {
    var projectBox = Hive.box<ProjectModel>(kProjectBox);
    final project = projectBox.get(projectKey);

    if (project != null) {
      tasks = project.projectTasks;
      emit(TasksSuccess());
    }
  }
}
