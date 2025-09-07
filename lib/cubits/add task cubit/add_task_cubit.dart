import 'package:day_task/cubits/add%20task%20cubit/add_task_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddTaskCubit extends Cubit<AddTaskState>{
  AddTaskCubit() : super(AddTaskInitial());
}