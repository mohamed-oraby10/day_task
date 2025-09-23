import 'package:day_task/constants.dart';
import 'package:day_task/cubits/task%20cubit/add%20task%20cubit/add_task_state.dart';
import 'package:day_task/model/project_model.dart';
import 'package:day_task/model/task_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';

class AddTaskCubit extends Cubit<AddTaskState> {
  AddTaskCubit() : super(AddTaskInitial());

  Future<void> addTask(TaskModel task, int projectKey) async {
    emit(AddTaskLoading());
    try {
      var projectBox = Hive.box<ProjectModel>(kProjectBox);
      final project = projectBox.get(projectKey);

      if (project != null) {
        project.projectTasks.add(task);
        await project.save();
        emit(AddTaskSuccess());
      } else {
        emit(AddTaskFailure("Project not found"));
      }
    } catch (e) {
      emit(AddTaskFailure(e.toString()));
    }
  }
}
