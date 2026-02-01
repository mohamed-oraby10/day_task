import 'package:day_task/constants.dart';
import 'package:day_task/cubits/project%20cubit/projects%20cubit/projects_cubit.dart';
import 'package:day_task/cubits/task%20cubit/tasks%20cubit/tasks_cubit.dart';
import 'package:day_task/utilitis/app_routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DayTask extends StatelessWidget {
  const DayTask({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
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
            navigatorKey: navigatorKey,
            initialRoute: user != null
                ? AppRoutes.homeRoute
                : AppRoutes.splashRoute,
            onGenerateRoute: AppRoutes.generateRoutes,
          );
        },
      ),
    );
  }
}
