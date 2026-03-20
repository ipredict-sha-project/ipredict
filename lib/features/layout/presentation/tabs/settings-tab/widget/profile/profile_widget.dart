import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../../core/theme/app_color.dart';
import '../../../../../../../core/widget/custoum_btn.dart';
import '../../../../../../auth/data/data_source/auth_provider.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthProvider>();

    final name = auth.userName.isNotEmpty ? auth.userName : "User";
    final email = auth.userEmail.isNotEmpty ? auth.userEmail : "No Email";

    final initials = name.isNotEmpty
        ? name.trim().split(" ").map((e) => e[0]).take(2).join()
        : "U";

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
        padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                /// AVATAR
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColor.blue,
                  ),
                  child: Text(
                    initials.toUpperCase(),
                    style: const TextStyle(
                      color: AppColor.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),

                const SizedBox(width: 20),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: AppColor.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),

                      const SizedBox(height: 8),

                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        decoration: BoxDecoration(
                          color: AppColor.blue,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text(
                          "User",
                          style: TextStyle(
                            color: AppColor.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),

                      const SizedBox(height: 8),

                      Text(
                        email,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: AppColor.gray,
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 15),

            CustoumBtn(
              text: 'Edit Profile',
              onTab: () {},
            ),
          ],
        ),
      ),
    );
  }
}