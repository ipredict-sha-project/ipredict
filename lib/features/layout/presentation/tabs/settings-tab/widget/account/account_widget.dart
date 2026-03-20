import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../../core/theme/app_color.dart';

class AccountWidget extends StatelessWidget {
  const AccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Account",
          style: TextStyle(
            color: AppColor.gray,
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
        ),

        const SizedBox(height: 30),

        /// ITEM 1
        _item(
          icon: "assets/icons/profile.svg",
          title: "Profile Settings",
          subtitle: "Manage your account details",
        ),

        const SizedBox(height: 10),

        /// ITEM 2
        _item(
          icon: "assets/icons/security.svg",
          title: "Privacy & Security",
          subtitle: "Control your privacy settings",
        ),
      ],
    );
  }

  Widget _item({
    required String icon,
    required String title,
    required String subtitle,
  }) {
    return Container(
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
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
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
                icon,
                color: AppColor.gray,
              ),
            ),

            const SizedBox(width: 15),

            /// TEXT
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: AppColor.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      color: AppColor.gray,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),

            /// ARROW
            const Icon(
              Icons.arrow_forward_ios,
              color: AppColor.gray,
              size: 18,
            ),
          ],
        ),
      ),
    );
  }
}