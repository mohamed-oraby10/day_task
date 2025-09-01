import 'package:day_task/utilitis/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.sufImage,
    this.onPress,
  });
  final String title;
  final String? sufImage;
  final void Function()? onPress;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: SvgPicture.asset("assets/images/arrowleft.svg"),
      ),
      backgroundColor: AppColors.backgroundColor,
      elevation: 0,
      foregroundColor: Colors.white,
      title: Center(child: Text(title)),
      actions: [
        if (sufImage != null)
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: IconButton(
              onPressed: onPress,
              icon: SvgPicture.asset(sufImage!),
            ),
          ),
          if (sufImage == null)
        const SizedBox(width: 56),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
