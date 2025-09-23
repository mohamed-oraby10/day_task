import 'package:day_task/constants.dart';
import 'package:day_task/cubits/project cubit/add project cubit/add_project_state.dart';
import 'package:day_task/model/project_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

class AddProjectCubit extends Cubit<AddProjectState> {
  AddProjectCubit() : super(AddProjectInitial());

  Future<void> addProject(ProjectModel project) async {
    emit(AddProjectLoading());
    try {
      var projectBox = Hive.box<ProjectModel>(kProjectBox);
      await projectBox.add(project);

      emit(AddProjectSuccess());
    } catch (e) {
      emit(AddProjectFailure(e.toString()));
    }
  }
}
