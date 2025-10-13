import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:day_task/model/team_member_model.dart';
import 'package:day_task/widgets/check_box_list.dart';
import 'package:flutter/material.dart';

class SelectedTeamMembersList extends StatelessWidget {
  const SelectedTeamMembersList({
    super.key,
    this.users,
    required this.selectedMembers,
    this.projectTeam,
  });

  final List<QueryDocumentSnapshot<Object?>>? users;
  final List<TeamMemberModel> selectedMembers;
  final List<TeamMemberModel>? projectTeam;

  @override
  Widget build(BuildContext context) {
    return projectTeam == null
        ? ListView.builder(
            itemCount: users!.length,
            itemBuilder: (context, index) {
              final data = users![index].data() as Map<String, dynamic>;

              final name = data['name'] ?? "Unknown";
              final image = data['photo'];
final id = (data['uid'] ?? users![index].id) as String;

              final member = TeamMemberModel(
                name: name,
                image: (image != null && image.isNotEmpty) ? image : null, id: id,
              );

              final isSelected = selectedMembers.any(
                (m) => m.name == member.name,
              );

              return CheckBoxList(
                isSelected: isSelected,
                name: name,
                image: image,
                onChanged: (checked) {
                  if (checked == true) {
                    selectedMembers.add(member);
                  } else {
                    selectedMembers.removeWhere((m) => m.name == member.name);
                  }
                  (context as Element).markNeedsBuild();
                },
              );
            },
          )
        : ListView.builder(
            itemCount: projectTeam!.length,
            itemBuilder: (context, index) {
              final data = projectTeam![index];
              final name = data.name;
              final image = data.image;
              final id = data.id;
              final member = TeamMemberModel(
                name: name,
                image: (image != null && image.isNotEmpty) ? image : null, id: id,
              );

              final isSelected = selectedMembers.any(
                (m) => m.name == member.name,
              );

              return CheckBoxList(
                isSelected: isSelected,
                name: name,
                image: image,
                onChanged: (checked) {
                  if (checked == true) {
                    selectedMembers.add(member);
                  } else {
                    selectedMembers.removeWhere((m) => m.name == member.name);
                  }
                  (context as Element).markNeedsBuild();
                },
              );
            },
          );
  }
}
