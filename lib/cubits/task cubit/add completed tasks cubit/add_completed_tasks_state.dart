abstract class AddCompletedTasksState {}

class AddCompletedTasksInitial extends AddCompletedTasksState {}

class AddCompletedTasksLoading extends AddCompletedTasksState {}

class AddCompletedTasksSuccess extends AddCompletedTasksState {}

class AddCompletedTasksFailure extends AddCompletedTasksState {
 final String errMessage;

  AddCompletedTasksFailure({required this.errMessage});
}
