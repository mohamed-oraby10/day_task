import 'package:day_task/widgets/check_box_list.dart';
import 'package:flutter/material.dart';

class GroupMembers extends StatelessWidget {
  const GroupMembers({
    super.key,
    this.users,
    required this.selectedMembers,
  });

  final List<Map<String, dynamic>>? users;
  final List<Map<String, dynamic>> selectedMembers;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: users!.length,
      itemBuilder: (context, index) {
        final user = users![index];
        final name = user['name'] ?? "Unknown";
        final image = user['photo'];
        final id = user['id'];

        final isSelected = selectedMembers.any((m) => m['id'] == id);

        return CheckBoxList(
          isSelected: isSelected,
          name: name,
          image: image,
          onChanged: (checked) {
            if (checked == true) {
              selectedMembers.add({
                'id': id,
                'name': name,
                'photo': image,
              });
            } else {
              selectedMembers.removeWhere((m) => m['id'] == id);
            }
            (context as Element).markNeedsBuild();
          },
        );
      },
    );
  }
}
