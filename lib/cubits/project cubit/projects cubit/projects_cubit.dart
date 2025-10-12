import 'package:day_task/constants.dart';
import 'package:day_task/cubits/project%20cubit/projects%20cubit/projects_state.dart';
import 'package:day_task/model/project_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

class ProjectsCubit extends Cubit<ProjectsState> {
  ProjectsCubit() : super(ProjectsInitial());

  List<ProjectModel>? projects;

  fetchAllProjects() async {
 final userId = FirebaseAuth.instance.currentUser!.uid;
    var box = Hive.box<ProjectModel>(kProjectBox);

    projects = box.values.where((p) => p.userId == userId).toList();

    emit(ProjectsSuccess());
  }
}
