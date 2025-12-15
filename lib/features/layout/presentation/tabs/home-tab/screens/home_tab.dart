import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ipredict/core/theme/app_color.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../widgets/appbar_widget.dart';
import '../widget/devices/devices_widget.dart';
import '../widget/live_graphs/live_graphs_widget.dart';
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
        child: Center(
          child: Column(
            children: [
              AppbarWidget(),
              SizedBox(
                height: 24,
              ),
              SystemHealthWidget(),
              SizedBox(
                height: 24,
              ),
              QuickStatusWidget(),
              SizedBox(
                height: 24,
              ),
              LiveGraphsWidget(),
              SizedBox(
                height: 24,
              ),
              RecentAlertsWidget(),
              SizedBox(
                height: 24,
              ),
              ServerStatusWidget(),
              SizedBox(
                height: 24,
              ),
              DevicesWidget(),
              SizedBox(height: 24,),
            ],
          ),
        ),
      )),
    );
  }
}
