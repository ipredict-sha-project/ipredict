import 'package:flutter/material.dart';

import '../../../../core/theme/app_color.dart';

class OnboardingModel extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  const OnboardingModel(
      {super.key,
        required this.title,
        required this.image,
        required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Center(child: Image.asset(image)),
        Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: AppColor.black, fontSize: 24, fontWeight: FontWeight.w400),
          ),
        ),
        if (subtitle != null)
          Text(
            subtitle!,
            style: TextStyle(
                color: AppColor.gray,
                height: 1.3,
                fontSize: 20,
                fontWeight: FontWeight.w400),
          ),
      ],
    );
  }
}
