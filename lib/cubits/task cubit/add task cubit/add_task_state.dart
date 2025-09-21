abstract class AddTaskState {}

class AddTaskInitial extends AddTaskState {}

class AddTaskLoading extends AddTaskState {}

class AddTaskSuccess extends AddTaskState {}

class AddTaskFailure extends AddTaskState {
  final String errorMessage;

  AddTaskFailure( this.errorMessage);
}
