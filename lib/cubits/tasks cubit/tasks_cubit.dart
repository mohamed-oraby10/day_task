import 'package:day_task/constants.dart';
import 'package:day_task/cubits/tasks%20cubit/tasks_state.dart';
import 'package:day_task/model/task_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

class TasksCubit extends Cubit<TasksState> {
    TasksCubit() : super(TasksInitial());
 
  featchAllTasks(TaskModel task) async {
    
    try {
      var tasksBox = Hive.box<TaskModel>(kTaskBox);
      List<TaskModel> tasks = tasksBox.values.toList();
      emit(TasksSuccess(tasks: tasks));
    } catch (e) {
    emit(TasksFailure(e.toString()));
    }
  }
}