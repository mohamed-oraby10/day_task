import 'package:day_task/constants.dart';
import 'package:day_task/cubits/project%20cubit/projects%20cubit/projects_cubit.dart';
import 'package:day_task/cubits/task%20cubit/add%20completed%20tasks%20cubit/add_completed_tasks_state.dart';
import 'package:day_task/model/project_model.dart';
import 'package:day_task/model/task_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

class AddCompletedTasksCubit extends Cubit<AddCompletedTasksState> {
  AddCompletedTasksCubit(this.projectsCubit) : super(AddCompletedTasksInitial());
final ProjectsCubit projectsCubit;
  addCompletedTask(TaskModel task, int projectKey) async {
    emit(AddCompletedTasksLoading());
    try {
      var projectBox = Hive.box<ProjectModel>(kProjectBox);
      final project = projectBox.get(projectKey);

      project?.completedTasks.add(task);
      project?.progressPercent = project.projectTasks.isEmpty
          ? 0
          : project.completedTasks.length / project.projectTasks.length;
      await project!.save();
      projectsCubit.fetchAllProjects();
      emit(AddCompletedTasksSuccess());
    } catch (e) {
      emit(AddCompletedTasksFailure(errMessage: e.toString()));
    }
  }
}
