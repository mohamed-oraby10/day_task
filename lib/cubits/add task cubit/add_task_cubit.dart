import 'package:day_task/constants.dart';
import 'package:day_task/cubits/add%20task%20cubit/add_task_state.dart';
import 'package:day_task/model/task_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';

class AddTaskCubit extends Cubit<AddTaskState> {
  AddTaskCubit() : super(AddTaskInitial());

  addTask(TaskModel task) async {
    emit(AddTaskLoading());
    try {
      var tasksBox = Hive.box<TaskModel>(kTaskBox);
      
      await tasksBox.add(task);
      emit(AddTaskSuccess());
    } catch (e) {
    emit(  AddTaskFailure(e.toString()));
    }
  }
}
