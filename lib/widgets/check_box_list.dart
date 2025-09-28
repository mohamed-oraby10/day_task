import 'package:day_task/constants.dart';
import 'package:day_task/widgets/default_image.dart';
import 'package:flutter/material.dart';

class CheckBoxList extends StatelessWidget {
  const CheckBoxList({
    super.key,
    required this.isSelected,
    required this.name,
    required this.image,
    required this.onChanged,
  });

  final bool isSelected;
  final String name;
  final String? image;
  final Function(bool?) onChanged;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: isSelected,
      activeColor: kMainColor,
      checkColor: kBackgroundColor,
      side: BorderSide(color: kLabelTextColor),
      title: Text(
        name,
        style: const TextStyle(color: Colors.white),
      ),
      secondary: CircleAvatar(
        backgroundColor: kMainColor,
        backgroundImage: (image != null && image!.isNotEmpty)
            ? NetworkImage(image!)
            : null,
        child: (image == null || image!.isEmpty)
            ? DefaultImage(name: name)
            : null,
      ),
      onChanged: onChanged,
    );
  }
}
