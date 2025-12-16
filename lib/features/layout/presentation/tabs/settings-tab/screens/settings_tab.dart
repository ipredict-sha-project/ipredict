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
          child: Center(
            child: Column(
              children: [
                AppbarWidget(),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Settings",
                  style: TextStyle(
                    color: Color(0xff222222),
                    fontSize: 28,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "System Configuration & Preferences",
                  style: TextStyle(
                      color: Color(0xff6A7282),
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 25,
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 350,
                    height: 60,
                    child: CupertinoButton(
                        borderRadius: BorderRadius.circular(30),
                        padding: EdgeInsets.all(20),
                        color: AppColor.red.withValues(alpha: 0.2),
                        child: Text(
                          "Log Out",
                          style: TextStyle(
                              color: AppColor.red,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                        onPressed: () {}),
                  ),
                ),
                SizedBox(height: 30,),
                Text('iPredict v2.1.0' , style: TextStyle(
                  color: AppColor.gray,
                  fontSize: 14,
                  fontWeight: FontWeight.w400
                ),),
                SizedBox(height: 30,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
