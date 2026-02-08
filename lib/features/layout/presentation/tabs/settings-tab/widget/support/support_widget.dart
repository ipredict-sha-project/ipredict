import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../../core/theme/app_color.dart';

class SupportWidget extends StatelessWidget {
  const SupportWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Support",
          style: TextStyle(
              color: AppColor.gray,
              fontSize: 20,
              fontWeight: FontWeight.w400),
        ),
        SizedBox(
          height: 30,
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                    color: AppColor.gray.withValues(alpha: 0.5),
                    spreadRadius: 2,
                    blurRadius: 8,
                    offset: Offset(0, 4))
              ],
              color: AppColor.white,
              border: Border.all(color: AppColor.gray_background)),
          child: Padding(
            padding:
            EdgeInsets.symmetric(vertical: 30, horizontal: 22),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: AppColor.gray.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(16)),
                  child: SvgPicture.asset(
                    "assets/icons/help.svg",
                    color: AppColor.gray,
                  ),
                ),
                Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Help & Support",
                      style: TextStyle(
                          color: AppColor.black,
                          fontSize: 22,
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      "Get help and contact us",
                      style: TextStyle(
                          color: AppColor.gray,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                Spacer(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.arrow_forward_ios , color: AppColor.gray,),
                  ],
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                    color: AppColor.gray.withValues(alpha: 0.5),
                    spreadRadius: 2,
                    blurRadius: 8,
                    offset: Offset(0, 4))
              ],
              color: AppColor.white,
              border: Border.all(color: AppColor.gray_background)),
          child: Padding(
            padding:
            EdgeInsets.symmetric(vertical: 30, horizontal: 22),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: AppColor.gray.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(16)),
                  child: SvgPicture.asset(
                    "assets/icons/about.svg",
                    color: AppColor.gray,
                  ),
                ),
                Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "About iPredict",
                      style: TextStyle(
                          color: AppColor.black,
                          fontSize: 22,
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      "Version 2.1.0",
                      style: TextStyle(
                          color: AppColor.gray,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                Spacer(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.arrow_forward_ios , color: AppColor.gray,),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
