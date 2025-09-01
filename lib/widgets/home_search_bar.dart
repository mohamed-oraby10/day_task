import 'package:day_task/widgets/container_button.dart';
import 'package:day_task/widgets/text_input.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 60,
          width: 310,
          child: TextInput(
            hint: 'Search Tasks',
            prefixIcon: FontAwesomeIcons.magnifyingGlass,
          ),
        ),
        SizedBox(width: 8),
        ContainerButton(
          width: 55,
          height: 55,
          image: "assets/images/Vector.svg",
        ),
      ],
    );
  }
}
