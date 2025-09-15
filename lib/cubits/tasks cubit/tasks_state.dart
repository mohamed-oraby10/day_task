import 'package:day_task/model/task_model.dart';

abstract class TasksState {}

class TasksInitial extends TasksState {}

class TasksLoading extends TasksState {}

class TasksSuccess extends TasksState {
  final List<TaskModel> tasks;

  TasksSuccess({required this.tasks});
}

class TasksFailure extends TasksState {
  final String errMessage;

  TasksFailure({required this.errMessage});
}
