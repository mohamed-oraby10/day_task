import 'package:day_task/constants.dart';
import 'package:day_task/day_task.dart';
import 'package:day_task/model/project_model.dart';
import 'package:day_task/model/task_model.dart';
import 'package:day_task/model/team_member_model.dart';
import 'package:day_task/provider/user_provider.dart';
import 'package:day_task/service/notification_service.dart';
import 'package:day_task/simple_bloc_observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Bloc.observer = SimpleBlocObserver();
  Hive.registerAdapter(TeamMemberModelAdapter());
  Hive.registerAdapter(TaskModelAdapter());
  Hive.registerAdapter(ProjectModelAdapter());
  await Hive.openBox<ProjectModel>(kProjectBox);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await NotificationService().init();
  await NotificationService().showNotification();
  runApp(
    ChangeNotifierProvider(
      create: (_) => UserProvider(),
      child: const DayTask(),
    ),
  );
}
