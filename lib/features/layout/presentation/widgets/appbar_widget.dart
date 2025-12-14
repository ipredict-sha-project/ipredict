import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/theme/app_color.dart';

class AppbarWidget extends StatelessWidget {
  const AppbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 82,
      child: AppBar(
        backgroundColor: Color(0xff155DFC),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "iPredict",
              style: TextStyle(
                  color: AppColor.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "Real-Time Monitoring System",
              style: TextStyle(
                  color: AppColor.gray_background,
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
        actions: [
          SvgPicture.asset("assets/icons/alarm.svg"),
          SizedBox(
            width: 20,
          ),
          SvgPicture.asset("assets/icons/profile.svg"),
        ],
      ),
    );
  }
}
