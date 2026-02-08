import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

import '../../../../../../../core/theme/app_color.dart';

class VibrationSensorWidget extends StatelessWidget {
  const VibrationSensorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                        'Vibration Sensor (ADXL345)',
                        style: TextStyle(
                            color: AppColor.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Measurement: Acceleration (g)',
                        style: TextStyle(
                            color: AppColor.gray,
                            fontSize: 15,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  Spacer(),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 18, vertical: 18),
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
                    child: SvgPicture.asset('assets/icons/vibration_speed.svg'),
                  )
                ],
              ),
              SizedBox(height: 20,),
              Column(
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
                          'ADXL345-005',
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
                          'Turbine Unit 1 - Side Panel',
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
                          '⏱️ 4 mins ago',
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
                    '2.8',
                    style: TextStyle(
                        color: AppColor.black,
                        fontSize: 48,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'g',
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
                    color: AppColor.orange.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(26),
                    border: Border.all(color: AppColor.orange)),
                child: Text(
                  'Warning',
                  style: TextStyle(
                      color: AppColor.orange,
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
    );
  }
}
