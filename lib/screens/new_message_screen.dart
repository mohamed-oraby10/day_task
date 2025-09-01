import 'package:day_task/widgets/custom_app_bar.dart';
import 'package:day_task/widgets/new_message_category.dart';
import 'package:day_task/utilitis/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NewMessage extends StatelessWidget {
  const NewMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "New Message",
        sufImage: "assets/images/searchnormal1.svg",
      ),

      body: Column(
        children: [
          ListTile(
            leading: GestureDetector(
              onTap: (){},
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: AppColors.mainColor,
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
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return NewMessageCategory(
                  image: 'assets/images/Ellipse 36 (2).png',
                  name: 'Amila',
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
