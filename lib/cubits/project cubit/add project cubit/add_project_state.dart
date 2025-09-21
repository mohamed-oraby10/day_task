abstract class AddProjectState {}

class AddProjectInitial extends AddProjectState {}

class AddProjectLoading extends AddProjectState {}

class AddProjectSuccess extends AddProjectState {}

class AddProjectFailure extends AddProjectState {
  final String errorMessage;

  AddProjectFailure( this.errorMessage);
}
