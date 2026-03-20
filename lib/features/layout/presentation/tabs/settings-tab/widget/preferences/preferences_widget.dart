import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../../core/theme/app_color.dart';

class PreferencesWidget extends StatelessWidget {
  const PreferencesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Preferences",
          style: TextStyle(
            color: AppColor.gray,
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
        ),

        const SizedBox(height: 30),

        /// 🔥 Notifications
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: AppColor.gray.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 8,
                offset: const Offset(0, 4),
              )
            ],
            color: AppColor.white,
            border: Border.all(color: AppColor.gray_background),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 25,
              horizontal: 20,
            ),
            child: Row(
              children: [
                /// ICON
                Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: AppColor.gray.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: SvgPicture.asset(
                    "assets/icons/alarm.svg",
                    color: AppColor.gray,
                  ),
                ),

                const SizedBox(width: 15),

                /// TEXT
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Notifications",
                        style: TextStyle(
                          color: AppColor.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Configure alert preferences",
                        style: TextStyle(
                          color: AppColor.gray,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),

                /// ARROW
                Icon(
                  Icons.arrow_forward_ios,
                  color: AppColor.gray,
                  size: 18,
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 12),

        /// 🔥 Appearance
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: AppColor.gray.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 8,
                offset: const Offset(0, 4),
              )
            ],
            color: AppColor.white,
            border: Border.all(color: AppColor.gray_background),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 25,
              horizontal: 20,
            ),
            child: Row(
              children: [
                /// ICON
                Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: AppColor.gray.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: SvgPicture.asset(
                    "assets/icons/Appearance.svg",
                    color: AppColor.gray,
                  ),
                ),

                const SizedBox(width: 15),

                /// TEXT
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Appearance",
                        style: TextStyle(
                          color: AppColor.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Light mode (Default)",
                        style: TextStyle(
                          color: AppColor.gray,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),

                /// ARROW
                Icon(
                  Icons.arrow_forward_ios,
                  color: AppColor.gray,
                  size: 18,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
