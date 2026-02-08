import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ipredict/core/theme/app_color.dart';
import 'package:ipredict/features/layout/presentation/tabs/sensors-tab/widget/air_qulatiy/air_quality_sensor_widget.dart';
import 'package:ipredict/features/layout/presentation/widgets/appbar_widget.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

import '../widget/SystemStatus.dart';
import '../widget/smoke/humidity_sensor_widget.dart';
import '../widget/sound/sound_sensor_widget.dart';
import '../widget/temperature/temperature_sensor_widget.dart';
import '../widget/vibration/vibration_sensor_widget.dart';

class SensorsTab extends StatelessWidget {
  const SensorsTab({super.key});

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
                        'Sensors',
                        style: TextStyle(
                            color: AppColor.black,
                            fontSize: 35,
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        'Live Monitoring & Analytics',
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
                  Systemstatus(),
                  SizedBox(
                    height: 30,
                  ),
                  TemperatureSensorWidget(),
                  SizedBox(
                    height: 30,
                  ),
                  HumiditySensorWidget(),
                  SizedBox(
                    height: 30,
                  ),
                  AirQualitySensorWidget(),
                  SizedBox(
                    height: 30,
                  ),
                  SoundSensorWidget(),
                  SizedBox(
                    height: 30,
                  ),
                  VibrationSensorWidget(),
                  SizedBox(
                    height: 40,
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
