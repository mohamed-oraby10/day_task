import 'package:day_task/enum.dart';
import 'package:day_task/utilitis/app_colors.dart';
import 'package:day_task/utilitis/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({required this.selectedMenu, super.key});

  final MenuState selectedMenu;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      color: const Color(0xFF263238),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildNavItem(
            context,
            iconPath: 'assets/images/home2.svg',
            label: 'Home',
            route: AppRoutes.homeRoute,
            menu: MenuState.home,
          ),
          buildNavItem(
            context,
            iconPath: 'assets/images/messages1.svg',
            label: 'Chat',
            route: AppRoutes.messageRoute,
            menu: MenuState.chat,
          ),

          buildCenterAddButton(context),
          buildNavItem(
            context,
            iconPath: 'assets/images/calendar.svg',
            label: 'Calendar',
            route: AppRoutes.scheduleRoute,
            menu: MenuState.calendar,
          ),
          buildNavItem(
            context,
            iconPath: 'assets/images/notification1.svg',
            label: 'Notification',
            route: AppRoutes.notificationRoute,
            menu: MenuState.notifications,
          ),
        ],
      ),
    );
  }

  Widget buildNavItem(
    BuildContext context, {
    required String iconPath,
    required String label,
    required String route,
    required MenuState menu,
  }) {
    final isSelected = selectedMenu == menu;
    final color = isSelected ? AppColors.mainColor : AppColors.labelTextColor;

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(iconPath, width: 24, height: 24, color: color),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: color,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCenterAddButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, AppRoutes.createTaskRoute);
      },
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(color: AppColors.mainColor),
        child: Center(
          child: SvgPicture.asset(
            'assets/images/addsquare.svg',
            width: 28,
            height: 28,
            fit: BoxFit.contain,
            color: AppColors.backgroundColor,
          ),
        ),
      ),
    );
  }
}
