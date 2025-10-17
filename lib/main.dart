import 'package:day_task/constants.dart';
import 'package:day_task/cubits/project%20cubit/projects%20cubit/projects_cubit.dart';
import 'package:day_task/cubits/task%20cubit/tasks%20cubit/tasks_cubit.dart';
import 'package:day_task/model/project_model.dart';
import 'package:day_task/model/task_model.dart';
import 'package:day_task/model/team_member_model.dart';
import 'package:day_task/provider/user_provider.dart';
import 'package:day_task/service/notification_service.dart';
import 'package:day_task/simple_bloc_observer.dart';
import 'package:day_task/utilitis/app_routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
  await NotificationService.init();
  NotificationService().scheduleDailyNotification(
    title: "Here’s your daily tasks",
    body: "Let’s get today’s tasks done!",
    hour: 9,
    minute: 0,
  );

  runApp(
    ChangeNotifierProvider(create: (_) => UserProvider(), child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TasksCubit()),
        BlocProvider(create: (context) => ProjectsCubit()),
      ],
      child: ScreenUtilInit(
        designSize: Size(428, 926),
        minTextAdapt: true,
        builder: (context, child) {
          return MaterialApp(
            title: 'DayTask',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              fontFamily: "Inter",
              scaffoldBackgroundColor: kBackgroundColor,
              useMaterial3: false,
            ),
            initialRoute: AppRoutes.splashRoute,
            onGenerateRoute: AppRoutes.generateRoutes,
          );
        },
      ),
    );
  }
}
