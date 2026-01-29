import 'package:day_task/constants.dart';
import 'package:day_task/enum.dart';
import 'package:day_task/utilitis/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({required this.selectedMenu, super.key});

  final MenuState selectedMenu;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 87.h,
      padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
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
    final color = isSelected ? kMainColor : kLabelTextColor;

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(iconPath, width: 24.w, height: 24.h, color: color),
          SizedBox(height: 4.h),
          Text(
            label,
            style: TextStyle(
              fontSize: 10.sp,
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
        Navigator.pushNamed(context, AppRoutes.createNewProjectRoute);
      },
      child: Container(
        height: 54.h,
        width: 54.w,
        decoration: BoxDecoration(color: kMainColor),
        child: Center(
          child: SvgPicture.asset(
            'assets/images/addsquare.svg',
            width: 24.w,
            height: 24.h,
            fit: BoxFit.contain,
            color: kBackgroundColor,
          ),
        ),
      ),
    );
  }
}
