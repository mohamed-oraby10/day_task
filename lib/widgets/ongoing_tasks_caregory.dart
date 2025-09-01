import 'package:day_task/utilitis/app_colors.dart';
import 'package:flutter/material.dart';

class OngoingTasks extends StatelessWidget {
  const OngoingTasks({
    super.key,
    required this.name,
    required this.date,
    required this.image,
    required this.percentageImage,
  });

  final String name;
  final String date;
  final String image;
  final String percentageImage;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Container(
          padding: EdgeInsets.all(8),

          color: AppColors.fillTextFormColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontFamily: "PilatExtended",
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                const Text(
                  'Team Members',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Row(
                    children: [
                      Image.asset('assets/images/Ellipse 2.png'),
                      Image.asset('assets/images/Ellipse 3.png'),
                      Image.asset('assets/images/Ellipse 4.png'),
                      const Spacer(flex: 6),
                      CircleAvatar(
                        radius: 21,
                        backgroundImage: AssetImage(percentageImage),
                        backgroundColor: const Color(0xFF2C4653),
                        child: CircleAvatar(
                          backgroundColor: AppColors.fillTextFormColor,
                          radius: 20,
                          child: Image.asset(image),
                        ),
                      ),
                      const Spacer(flex: 1),
                    ],
                  ),
                ),
                Text(
                  date,
                  style: const TextStyle(color: Colors.white, fontSize: 15),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
