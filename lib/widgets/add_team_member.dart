import 'package:day_task/utilitis/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AddTeamMember extends StatelessWidget {
  const AddTeamMember({super.key, this.memberName});
  final String? memberName;
  // final String? memberImage;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 150,
      color: AppColors.fillTextFormColor,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: CircleAvatar(
              radius: 10,
              child: Image.asset("assets/images/Ellipse 44.png"),
            ),
          ),
          const Spacer(flex: 1),
          const Text(
            'Robert',
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
          const Spacer(flex: 3),
          IconButton(
            icon: SvgPicture.asset('assets/images/closesquare.svg'),
            onPressed: () {},
          ),
          const Spacer(flex: 1),
        ],
      ),
    );
  }
}
