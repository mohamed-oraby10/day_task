import 'package:day_task/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AddTeamMember extends StatelessWidget {
  const AddTeamMember({super.key, this.memberName, this.onPress,});
  final String? memberName;
  // final String? memberImage;
  final void Function()? onPress;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
        height: 40,
        width: 135,
        color: kFillTextFormColor,
        child: Row(
          children: [
            // Padding(
            //   padding: const EdgeInsets.only(left: 8),
            //   child: CircleAvatar(
            //     radius: 10,
            //     child: Image.asset(memberImage!),
            //   ),
            // ),
            // const Spacer(flex: 1),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text(
                  memberName!,
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ),
            ),
            SizedBox(width: 5),
            IconButton(
              icon: SvgPicture.asset('assets/images/closesquare.svg'),
              onPressed:onPress,
            ),
            // const Spacer(flex: 1),
          ],
        ),
      ),
    );
  }
}
