import 'package:day_task/constants.dart';
import 'package:day_task/widgets/create_group_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CreateGroupButton extends StatelessWidget {
  const CreateGroupButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: GestureDetector(
        onTap: () {
          showDialog(
            context: context,
            builder: (context) {
              return CreateGroupDialog();
            },
          );
        },
        child: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: kMainColor,
            borderRadius: BorderRadius.circular(100),
          ),
          child: Center(
            child: SvgPicture.asset("assets/images/profile2user.svg"),
          ),
        ),
      ),
      title: Text(
        "Create a group",
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
