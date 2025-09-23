import 'package:day_task/constants.dart';
import 'package:day_task/cubits/project%20cubit/projects%20cubit/projects_state.dart';
import 'package:day_task/model/project_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

class ProjectsCubit extends Cubit<ProjectsState> {
  ProjectsCubit() : super(ProjectsInitial());

  List<ProjectModel>? projects;

  fetchAllProjects() {
    var projectBox = Hive.box<ProjectModel>(kProjectBox);
    projects = projectBox.values.toList();

    emit(ProjectsSuccess());
  }
}
