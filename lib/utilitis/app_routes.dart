import 'package:day_task/screens/chat_group_screen.dart';
import 'package:day_task/screens/chat_screen.dart';
import 'package:day_task/screens/create_new_project_screen.dart';
import 'package:day_task/screens/create_new_task_screen.dart';
import 'package:day_task/screens/groupes_messages_screen.dart';
import 'package:day_task/screens/masseges_screen.dart';
import 'package:day_task/screens/home_screen.dart';
import 'package:day_task/screens/login_screen.dart';
import 'package:day_task/screens/new_message_screen.dart';
import 'package:day_task/screens/notifications_screen.dart';
import 'package:day_task/screens/profile_screen.dart';
import 'package:day_task/screens/register_screen.dart';
import 'package:day_task/screens/schedule_screen.dart';
import 'package:day_task/screens/splash_screen.dart';
import 'package:day_task/screens/project_details_screen.dart';
import 'package:day_task/screens/task_details_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String splashRoute = '/splash';
  static const String loginRoute = '/login';
  static const String registerRoute = '/register';
  static const String homeRoute = '/home';
  static const String messageRoute = '/message';
  static const String groupRoute = '/group';
  static const String newMessageRoute = '/newMessage';
  static const String scheduleRoute = '/schedule';
  static const String chatingRoute = '/chating';
  static const String createTaskRoute = '/createTask';
  static const String notificationRoute = '/notification';
  static const String profileRoute = '/profile';
  static const String projectDetailsRoute = '/projectDetails';
  static const String createNewProjectRoute = '/createNewProhect';
  static const String taskDetailsRoute = '/taskDetails';
  static const String chatGroupRoute = '/chatGroup';

  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case registerRoute:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case homeRoute:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case messageRoute:
        return MaterialPageRoute(builder: (_) => const MassegesScraan());
      case groupRoute:
        return MaterialPageRoute(builder: (_) => const GroupesChatScreen());
      case newMessageRoute:
        return MaterialPageRoute(builder: (_) => const NewMessage());
      case scheduleRoute:
        return MaterialPageRoute(builder: (_) => const ScheduleSceen());
      case chatingRoute:
        return MaterialPageRoute(
          builder: (_) => const ChatScreen(),
          settings: settings,
        );

      case createTaskRoute:
        return MaterialPageRoute(
          builder: (_) => const CreateNewTask(),
          settings: settings,
        );
      case notificationRoute:
        return MaterialPageRoute(builder: (_) => const NotificationsScreen());
      case profileRoute:
        return MaterialPageRoute(
          builder: (_) => const ProfileScreen(),
          settings: settings,
        );
      case taskDetailsRoute:
        return MaterialPageRoute(builder: (_) => const TaskDetailsScreen());
      case chatGroupRoute:
        return MaterialPageRoute(
          builder: (_) => const ChatGroupScreen(),
          settings: settings,
        );
      case projectDetailsRoute:
        return MaterialPageRoute(
          builder: (_) => const ProjectDetailsScreen(),
          settings: settings,
        );
      case createNewProjectRoute:
        return MaterialPageRoute(
          builder: (_) => const CreateNewProjectScreen(),
        );
      case AppRoutes.splashRoute:
      default:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
    }
  }
}
