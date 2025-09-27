abstract class TasksOfTodayState {}

class TasksOfTodayInitial extends TasksOfTodayState {}

class TasksOfTodaySuccess extends TasksOfTodayState {}

class TasksOfTodayFailure extends TasksOfTodayState {
  final String errMessage;

  TasksOfTodayFailure(this.errMessage);
}
