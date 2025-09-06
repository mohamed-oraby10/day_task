import 'package:day_task/constants.dart';
import 'package:day_task/provider/user_provider.dart';
import 'package:day_task/utilitis/app_routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  await Hive.initFlutter();
  await Hive.openBox(kTaskBox);
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
  }
}
