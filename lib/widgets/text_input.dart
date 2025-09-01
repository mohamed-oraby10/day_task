import 'package:day_task/utilitis/app_colors.dart';
import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  final String hint;
  final IconData? prefixIcon;
  final bool isPassword;
  final int maxLines;
  final Function(String)? onChanged;

  const TextInput({
    super.key,
    required this.hint,
    this.prefixIcon,
    this.isPassword = false,
    this.maxLines = 1, this.onChanged
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      maxLines: maxLines,
      obscureText: isPassword,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hint,
        
        hintStyle: const TextStyle(color: Colors.white, fontSize: 18),
        border: const OutlineInputBorder(),
        fillColor: AppColors.fillTextFormColor,
        filled: true,
        prefixIcon: Icon(prefixIcon, color: Colors.white),
        suffixIcon: isPassword
            ? IconButton(
                onPressed: () {},
                icon: const Icon(Icons.visibility_off, color: Colors.white),
              )
            : null,
      ),
    );
  }
}
