import 'package:day_task/constants.dart';
import 'package:flutter/material.dart';

class TaskCheckBox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;

  const TaskCheckBox({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChanged(!value),
      
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          color: kMainColor,
        
        ),
        child: Center(
          child: Icon(
            value ? Icons.check_circle_outline : Icons.circle_outlined  ,
            color: kBackgroundColor, 
            size: 28,
          ),
        ),
      ),
    );
  }
}
