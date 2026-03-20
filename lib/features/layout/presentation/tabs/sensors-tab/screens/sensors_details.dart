import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ipredict/core/theme/app_color.dart';
import 'package:ipredict/features/layout/presentation/widgets/appbar_widget.dart';

import '../../../../data/models/sensor_module.dart';

class SensorsDetails extends StatelessWidget {
  final SensorModel sensor;

  const SensorsDetails({super.key, required this.sensor});

  Color getColor() {
    if (sensor.calculatedStatus == "critical") return AppColor.red;
    if (sensor.calculatedStatus == "warning") return AppColor.orange;
    return AppColor.green;
  }

  String getIcon() {
    switch (sensor.type) {
      case "temperature":
        return 'assets/icons/Temperature.svg';
      case "humidity":
        return 'assets/icons/Humidity.svg';
      case "air":
        return 'assets/icons/smoke.svg';
      case "sound":
        return 'assets/icons/sound.svg';
      case "vibration":
        return 'assets/icons/vibration_speed.svg';
      default:
        return 'assets/icons/warning.svg';
    }
  }

  @override
  Widget build(BuildContext context) {
    final color = getColor();

    return Scaffold(
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppbarWidget(),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),

                    /// BACK
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Container(
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
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 13),
                          child: Icon(Icons.arrow_back_ios_new),
                        ),
                      ),
                    ),

                    const SizedBox(height: 30),

                    /// CARD
                    Container(
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

                            /// HEADER
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                                  decoration: BoxDecoration(
                                    color: color.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(16),
                                    border: Border.all(color: color),
                                  ),
                                  child: SvgPicture.asset(
                                    getIcon(),
                                    color: color,
                                  ),
                                ),

                                const SizedBox(width: 10),

                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      sensor.name,
                                      style: const TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w400,
                                        color: AppColor.black,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      sensor.id,
                                      style: const TextStyle(
                                        color: AppColor.gray,
                                        fontSize: 15,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      sensor.location,
                                      style: const TextStyle(
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                ),

                                const Spacer(),

                                /// STATUS
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                                  decoration: BoxDecoration(
                                    color: color.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(16),
                                    border: Border.all(color: color),
                                  ),
                                  child: Text(
                                    sensor.calculatedStatus.toUpperCase(),
                                    style: TextStyle(color: color),
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 20),

                            /// CURRENT VALUE
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                              decoration: BoxDecoration(
                                color: color.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(color: color),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Current Reading',
                                    style: TextStyle(
                                      color: AppColor.gray,
                                      fontSize: 20,
                                    ),
                                  ),
                                  const SizedBox(height: 15),
                                  Text(
                                    "${sensor.value.toStringAsFixed(1)} ${sensor.unit}",
                                    style: TextStyle(
                                      color: color,
                                      fontSize: 50,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(height: 20),

                            Text(
                              "Last updated: ${sensor.lastUpdate}",
                              style: const TextStyle(
                                color: AppColor.gray,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    /// STATS (نفس الشكل بس dynamic)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _box("Current", sensor.value, sensor.unit, color),
                        _box("Average", sensor.value * 0.7, sensor.unit, AppColor.gray),
                        _box("Peak", sensor.value * 1.1, sensor.unit, AppColor.orange),
                        _box("Min", sensor.value * 0.5, sensor.unit, AppColor.blue),
                      ],
                    ),

                    const SizedBox(height: 40),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _box(String title, double value, String unit, Color color) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColor.white,
        border: Border.all(color: AppColor.gray_background),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 15),
        child: Column(
          children: [
            Text(title, style: const TextStyle(color: AppColor.gray)),
            const SizedBox(height: 10),
            Text(
              "${value.toStringAsFixed(1)}$unit",
              style: TextStyle(color: color),
            )
          ],
        ),
      ),
    );
  }
}