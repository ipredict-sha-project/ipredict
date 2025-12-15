import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ipredict/core/theme/app_color.dart';
import 'package:ipredict/features/layout/presentation/widgets/appbar_widget.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

import '../widget/overview_widget.dart';
import '../widget/smoke/smoke_sensor_widget.dart';
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
          child:SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  AppbarWidget(),
                  SizedBox(height: 30,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('Sensors' , style: TextStyle(
                        color: AppColor.black,
                        fontSize: 30,
                        fontWeight: FontWeight.w400
                      ),),
                      Text('Live Monitoring & Analytics' , style: TextStyle(
                        color: AppColor.gray,
                        fontSize: 14,
                        fontWeight: FontWeight.w400
                      ),)
                    ],
                  ),
                  SizedBox(height: 30,),
                  OverviewWidget(),
                  SizedBox(height: 30,),
                  TemperatureSensorWidget() ,
                  SizedBox(height: 30,),
                  SmokeSensorWidget(),
                  SizedBox(height: 30,),
                  VibrationSensorWidget(),
                  SizedBox(height: 30,),
                  SoundSensorWidget(),
                  SizedBox(height: 35,),
                ],
              ),
            ),
          )
      ),
    );
  }
}
