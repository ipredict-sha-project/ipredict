import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ipredict/core/routes_manager/routes/app_route_name.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

import '../../../../../../../core/theme/app_color.dart';

class TemperatureSensorWidget extends StatelessWidget {
  const TemperatureSensorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, AppRouteName.sensor_details);
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                    color: AppColor.gray.withValues(alpha: 0.5),
                    spreadRadius: 2,
                    blurRadius: 8,
                    offset: Offset(0, 4))
              ],
              color: AppColor.white,
              border: Border.all(color: AppColor.gray_background)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Temperature Sensor (BME680)',
                          style: TextStyle(
                              color: AppColor.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Measurement: Celsius (°C)',
                          style: TextStyle(
                              color: AppColor.gray,
                              fontSize: 15,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    Spacer(),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 22, vertical: 12),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                                color: AppColor.gray.withValues(alpha: 0.5),
                                spreadRadius: 2,
                                blurRadius: 8,
                                offset: Offset(0, 4))
                          ],
                          color: AppColor.gray_background.withValues(alpha: 0.9),
                          border: Border.all(color: AppColor.gray_background)),
                      child: SvgPicture.asset('assets/icons/Temperature.svg'),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 400,
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      decoration: BoxDecoration(
                          color: AppColor.gray_background,
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(color: AppColor.gray)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Sensor ID',
                            style: TextStyle(
                                color: AppColor.gray,
                                fontSize: 15,
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            'BME680-T-001',
                            style: TextStyle(
                                color: AppColor.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 400,
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      decoration: BoxDecoration(
                          color: AppColor.blue.withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(color: AppColor.gray)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Location',
                            style: TextStyle(
                                color: AppColor.gray,
                                fontSize: 15,
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            'Server Room A - Rack 3',
                            style: TextStyle(
                                color: AppColor.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 400,
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      decoration: BoxDecoration(
                          color: AppColor.gray_background,
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(color: AppColor.gray)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Last Update',
                            style: TextStyle(
                                color: AppColor.gray,
                                fontSize: 15,
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            '⏱️ 2 mins ago',
                            style: TextStyle(
                                color: AppColor.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Text(
                      '28.6',
                      style: TextStyle(
                          color: AppColor.black,
                          fontSize: 48,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '°C',
                      style: TextStyle(
                          color: AppColor.gray,
                          fontSize: 48,
                          fontWeight: FontWeight.w400),
                    )
                  ],
                ),
                SizedBox(
                  height: 18,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 27, vertical: 15),
                  decoration: BoxDecoration(
                      color: AppColor.green.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(26),
                      border: Border.all(color: AppColor.green)),
                  child: Text(
                    'Normal',
                    style: TextStyle(
                        color: AppColor.green,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                SizedBox(
                  height: 18,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
