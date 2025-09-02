import 'package:day_task/utilitis/app_colors.dart';
import 'package:flutter/material.dart';

class TextInput extends StatefulWidget {
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
    this.maxLines = 1,
    this.onChanged,
  });

  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  late bool obscure;
  @override
  void initState() {
    super.initState();
    obscure = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (data) {
        if (data!.isEmpty) {
          return "Field is required";
        }
      },
      onChanged: widget.onChanged,
      maxLines: widget.maxLines,
      obscureText: obscure,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: widget.hint,

        hintStyle: const TextStyle(color: Colors.white, fontSize: 18),
        border: const OutlineInputBorder(),
        fillColor: AppColors.fillTextFormColor,
        filled: true,
        prefixIcon: Icon(widget.prefixIcon, color: Colors.white),
        suffixIcon: widget.isPassword
            ? IconButton(
                onPressed: () {
                  setState(() {
                    obscure = !obscure;
                  });
                },
                icon: Icon(
                  obscure ? Icons.visibility_off : Icons.visibility,
                  color: Colors.white,
                ),
              )
            : null,
      ),
    );
  }
}
