import 'package:day_task/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ChatTextField extends StatefulWidget {
  const ChatTextField({super.key});

  @override
  State<ChatTextField> createState() => _ChatTextFieldState();
}

class _ChatTextFieldState extends State<ChatTextField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      width: 300,
      child: TextFormField(
        style: TextStyle(color: Colors.white),
        maxLines: 3,
        decoration: InputDecoration(
          hint: Text(
            "Type a message",
            style: TextStyle(color: kLabelTextColor, fontSize: 16),
          ),

          prefixIcon: PopupMenuButton(
            icon: SvgPicture.asset("assets/images/elementequal.svg"),
            color: kSecondColor,
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 'data',
                child: ListTile(
                  title: Text(
                    "Photos & videos",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  leading: Icon(FontAwesomeIcons.image, color: kMainColor),
                ),
              ),
              PopupMenuItem(
                value: 'data',
                child: ListTile(
                  title: Text(
                    "Document",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  leading: Icon(FontAwesomeIcons.file, color: kMainColor),
                ),
              ),
            ],
          ),

          suffixIcon: IconButton(
            onPressed: () {},
            icon: SvgPicture.asset("assets/images/send.svg"),
          ),

          fillColor: kSecondColor,
          filled: true,
        ),
      ),
    );
  }
}
