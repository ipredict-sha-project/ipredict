import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ipredict/features/layout/presentation/tabs/alerts-tab/widget/RESOLVED_alert.dart';
import 'package:ipredict/features/layout/presentation/tabs/alerts-tab/widget/WARNING_alert.dart';
import 'package:ipredict/features/layout/presentation/tabs/alerts-tab/widget/total_alert_row.dart';
import 'package:ipredict/features/layout/presentation/widgets/appbar_widget.dart';

import '../../../../../../core/theme/app_color.dart';
import '../widget/CRITICAL_alert.dart';

class AlertsTab extends StatelessWidget {
  const AlertsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppbarWidget(),
            Container(
              padding: EdgeInsets.symmetric(vertical: 15 , horizontal: 15),
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: Text(
                      "Alerts",
                      style: TextStyle(
                        color: Color(0xff222222),
                        fontSize: 35,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Critical Events & System Notifications",
                    style: TextStyle(
                        color: Color(0xff6A7282),
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TotalAlertRow(),
                  SizedBox(
                    height: 25,
                  ),
                  CriticalAlert(),
                  SizedBox(height: 15,),
                  CriticalAlert(),
                  SizedBox(height: 15,),
                  CriticalAlert(),
                  SizedBox(height: 15,),
                  WarningAlert(),
                  SizedBox(height: 15,),
                  WarningAlert(),
                  SizedBox(height: 15,),
                  ResolvedAlert(),
                  SizedBox(height: 40,)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
