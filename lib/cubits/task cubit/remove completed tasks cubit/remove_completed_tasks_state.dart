abstract class RemoveCompletedTasksState {}

class RemoveCompletedTasksInitial extends RemoveCompletedTasksState {}

class RemoveCompletedTasksLoading extends RemoveCompletedTasksState {}

class RemoveCompletedTasksSuccess extends RemoveCompletedTasksState {}

class RemoveCompletedTasksFailure extends RemoveCompletedTasksState {
 final String errMessage;

  RemoveCompletedTasksFailure({required this.errMessage});
}
