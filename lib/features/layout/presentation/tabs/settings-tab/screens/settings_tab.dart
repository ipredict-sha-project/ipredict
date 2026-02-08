import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ipredict/core/theme/app_color.dart';
import 'package:ipredict/features/layout/presentation/widgets/appbar_widget.dart';

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
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppbarWidget(),
              Container(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                child: Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Column(
                      children: [
                        Text(
                          "Settings",
                          style: TextStyle(
                            color: AppColor.black,
                            fontSize: 35,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          "System Configuration & Preferences",
                          style: TextStyle(
                              color: AppColor.gray,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    ProfileWidget(),
                    SizedBox(
                      height: 30,
                    ),
                    AccountWidget(),
                    SizedBox(
                      height: 30,
                    ),
                    PreferencesWidget(),
                    SizedBox(
                      height: 30,
                    ),
                    SupportWidget(),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      child: CupertinoButton(
                          borderRadius: BorderRadius.circular(30),
                          padding: EdgeInsets.all(20),
                          color: AppColor.red.withValues(alpha: 0.2),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10 , horizontal: 150),
                            child: Text(
                              "Log Out",
                              style: TextStyle(
                                  color: AppColor.red,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          onPressed: () {}),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'iPredict v2.1.0',
                      style: TextStyle(
                          color: AppColor.gray,
                          fontSize: 18,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
