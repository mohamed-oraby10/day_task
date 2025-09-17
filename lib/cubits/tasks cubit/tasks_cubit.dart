import 'package:day_task/constants.dart';
import 'package:day_task/cubits/tasks%20cubit/tasks_state.dart';
import 'package:day_task/model/task_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

class TasksCubit extends Cubit<TasksState> {
  TasksCubit() : super(TasksInitial());
  List<TaskModel>? tasks;
  featchAllTasks()  {
    var tasksBox = Hive.box<TaskModel>(kTaskBox);
    tasks = tasksBox.values.toList();
  }
}
