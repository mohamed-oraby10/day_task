import 'package:day_task/widgets/container_button.dart';
import 'package:day_task/widgets/text_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeSearchBar extends StatefulWidget {
  const HomeSearchBar({super.key, this.onChanged});
  final void Function(String)? onChanged;

  @override
  State<HomeSearchBar> createState() => _HomeSearchBarState();
}

class _HomeSearchBarState extends State<HomeSearchBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 60.h,
          width: 310.w,
          child: TextInput(
            onChanged: widget.onChanged,
            hint: 'Search Tasks',
            prefixIcon: FontAwesomeIcons.magnifyingGlass,
          ),
        ),
        SizedBox(width: 14.w),
        ContainerButton(
          width: 57.w,
          height: 58.h,
          image: "assets/images/Vector.svg",
        ),
      ],
    );
  }
}
