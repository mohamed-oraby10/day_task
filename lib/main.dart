import 'package:day_task/constants.dart';
import 'package:day_task/cubits/add%20task%20cubit/add_task_cubit.dart';
import 'package:day_task/model/task_model.dart';
import 'package:day_task/model/team_member_model.dart';
import 'package:day_task/provider/user_provider.dart';
import 'package:day_task/simple_bloc_observer.dart';
import 'package:day_task/utilitis/app_routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  await Hive.initFlutter();
  Bloc.observer = SimpleBlocObserver();
  Hive.registerAdapter(TaskModelAdapter());
  Hive.registerAdapter(TeamMemberModelAdapter());
  await Hive.openBox<TaskModel>(kTaskBox);
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    ChangeNotifierProvider(create: (_) => UserProvider(), child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => AddTaskCubit())],
      child: MaterialApp(
        title: 'DayTask',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: "Inter",
          scaffoldBackgroundColor: kBackgroundColor,
          useMaterial3: false,
        ),
        initialRoute: AppRoutes.splashRoute,
        onGenerateRoute: AppRoutes.generateRoutes,
      ),
    );
  }
}
