import 'package:day_task/constants.dart';
import 'package:day_task/model/project_model.dart';
import 'package:flutter/material.dart';

class TeamMembersImages extends StatelessWidget {
  const TeamMembersImages({super.key, required this.project,  this.imagesColor = kMainColor});
  final ProjectModel project;
  final Color imagesColor;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25,
      width: 80,
      child: Stack(
        children: List.generate(project.projectTeam.length, (index) {
          final member = project.projectTeam[index];

          return Positioned(
            left: index * 15,
            child: CircleAvatar(
              radius: 10,
              backgroundColor: imagesColor,
              backgroundImage:
                  (member.image != null && member.image!.isNotEmpty)
                  ? NetworkImage(member.image!)
                  : null,
              child: (member.image == null || member.image!.isEmpty)
                  ? Text(
                      member.name.isNotEmpty
                          ? member.name[0].toUpperCase()
                          : "?",
                      style: const TextStyle(
                        color: kBackgroundColor,
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  : null,
            ),
          );
        }),
      ),
    );
  }
}
