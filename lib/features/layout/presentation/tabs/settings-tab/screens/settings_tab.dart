import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ipredict/core/theme/app_color.dart';
import 'package:provider/provider.dart';

import '../../../../../auth/data/data_source/auth_provider.dart';
import '../../../widgets/appbar_widget.dart';
import '../widget/account/account_widget.dart';
import '../widget/preferences/preferences_widget.dart';
import '../widget/profile/profile_widget.dart';
import '../widget/support/support_widget.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: ListView(
          children: [
            Column(
                children: [
                  AppbarWidget(),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    child: Column(
                      children: [
                        const SizedBox(height: 30),

                        const Text(
                          "Settings",
                          style: TextStyle(fontSize: 35),
                        ),
                        const Text(
                          "System Configuration & Preferences",
                          style: TextStyle(color: Colors.grey),
                        ),

                        const SizedBox(height: 30),

                        const ProfileWidget(),
                        const SizedBox(height: 30),

                        const AccountWidget(),
                        const SizedBox(height: 30),

                        const PreferencesWidget(),
                        const SizedBox(height: 30),

                        const SupportWidget(),
                        const SizedBox(height: 30),

                        /// LOGOUT
                        CupertinoButton(
                          borderRadius: BorderRadius.circular(30),
                          padding: EdgeInsets.all(20),
                          color: AppColor.red.withValues(alpha: 0.2),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 150),
                            child: Text(
                              "Log Out",
                              style: TextStyle(
                                color: AppColor.red,
                                fontSize: 20,
                              ),
                            ),
                          ),
                            onPressed: () async {
                              final provider = context.read<AuthProvider>();

                              await provider.logout();

                              if (context.mounted) {
                                Navigator.pushNamedAndRemoveUntil(
                                  context,
                                  "/login",
                                      (route) => false,
                                );
                              }
                            }
                        ),

                        const SizedBox(height: 30),

                        const Text("iPredict v2.1.0",
                            style: TextStyle(color: AppColor.gray)),

                        const SizedBox(height: 40),
                      ],
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
