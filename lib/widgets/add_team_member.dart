import 'package:day_task/constants.dart';
import 'package:day_task/widgets/default_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AddTeamMember extends StatelessWidget {
  const AddTeamMember({
    super.key,
    this.memberName,
    this.onPress,
    this.memberImage,
  });
  final String? memberName;
  final String? memberImage;
  final void Function()? onPress;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
        height: 40,
        width: 150,
        color: kFillTextFormColor,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: CircleAvatar(radius: 10, backgroundImage: (memberImage != null) ? NetworkImage(memberImage!) : null, child:(memberImage == null) ? DefaultImage(name: memberName!) : null),
            ),
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
            SizedBox(width: 4),
            IconButton(
              icon: SvgPicture.asset('assets/images/closesquare.svg'),
              onPressed: onPress,
            ),
            // const Spacer(flex: 1),
          ],
        ),
      ),
    );
  }
}
