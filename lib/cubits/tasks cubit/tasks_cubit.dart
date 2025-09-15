import 'package:day_task/cubits/tasks%20cubit/tasks_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TasksCubit extends Cubit<TasksState> {
    TasksCubit() : super(TasksInitial());
 
 
}