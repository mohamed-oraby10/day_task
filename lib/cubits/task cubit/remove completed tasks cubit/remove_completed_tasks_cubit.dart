import 'package:day_task/constants.dart';
import 'package:day_task/cubits/project%20cubit/projects%20cubit/projects_cubit.dart';
import 'package:day_task/cubits/task%20cubit/remove%20completed%20tasks%20cubit/remove_completed_tasks_state.dart';
import 'package:day_task/model/project_model.dart';
import 'package:day_task/model/task_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

class RemoveCompletedTasksCubit extends Cubit<RemoveCompletedTasksState> {
  RemoveCompletedTasksCubit(this.projectCubit)
    : super(RemoveCompletedTasksInitial());
  final ProjectsCubit projectCubit;
  removeCompletedTask(TaskModel task, int projectKey) async {
    emit(RemoveCompletedTasksLoading());
    try {
      var projectBox = Hive.box<ProjectModel>(kProjectBox);
      final project = projectBox.get(projectKey);

project?.completedTasks.removeWhere((t) => t.details == task.details);
      project?.progressPercent = project.projectTasks.isEmpty
          ? 0
          : project.completedTasks.length / project.projectTasks.length;
      await project!.save();
      projectCubit.fetchAllProjects();
      emit(RemoveCompletedTasksSuccess());
    } catch (e) {
      emit(RemoveCompletedTasksFailure(errMessage: e.toString()));
    }
  }
}
