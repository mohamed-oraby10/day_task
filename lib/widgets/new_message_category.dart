import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NewMessageCategory extends StatelessWidget {
  NewMessageCategory({this.image, this.name});
  String? image;
  String? name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: ListTile(
        leading: Image.asset(image!),
        title: Text(
          name!,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
