import 'package:flutter/material.dart';
import 'package:ipredict/core/theme/app_color.dart';

import '../../../widgets/appbar_widget.dart';
import '../widget/quick_status/quick_status_widget.dart';
import '../widget/recent_alert/recent_alerts_widget.dart';
import '../widget/server_status/server_status_widget.dart';
import '../widget/system_health/system_health_widget.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

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
              padding: EdgeInsets.symmetric(vertical: 15 , horizontal: 15),
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Column(
                    children: [
                      Text(
                        'Dashboard',
                        style: TextStyle(
                            color: AppColor.black,
                            fontSize: 35,
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        'Real-Time System Overview',
                        style: TextStyle(
                            color: AppColor.gray,
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SystemHealthWidget(),
                  SizedBox(
                    height: 24,
                  ),
                  QuickStatusWidget(),
                  SizedBox(
                    height: 24,
                  ),
                  RecentAlertsWidget(),
                  SizedBox(
                    height: 24,
                  ),
                  ServerStatusWidget(),
                  SizedBox(height: 40,),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
