import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

import '../../../../../../../core/theme/app_color.dart';

class TemperatureSensorWidget extends StatelessWidget {
  const TemperatureSensorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: 400,
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
                  Row(
                    children: [
                      Text(
                        'Temperature Sensor',
                        style: TextStyle(
                            color: AppColor.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        '(DHT22)',
                        style: TextStyle(
                            color: AppColor.gray,
                            fontSize: 12,
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
              Column(
                children: [
                  Container(
                    width: 227,
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
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          'DHT22-T-001',
                          style: TextStyle(
                              color: AppColor.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 227,
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
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          'Server Room A - Rack 3',
                          style: TextStyle(
                              color: AppColor.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 227,
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
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          '⏱️ 2 mins ago',
                          style: TextStyle(
                              color: AppColor.black,
                              fontSize: 14,
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
              Text(
                '28.6',
                style: TextStyle(
                    color: AppColor.black,
                    fontSize: 48,
                    fontWeight: FontWeight.w400),
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
              Container(
                child: SfSparkLineChart.custom(
                  //Enable the trackball
                  trackball: SparkChartTrackball(
                    activationMode: SparkChartActivationMode.tap,
                  ),
                  //Enable marker
                  marker: SparkChartMarker(
                    displayMode: SparkChartMarkerDisplayMode.all,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Analytics History'.toUpperCase(),
                    style: TextStyle(
                        color: AppColor.gray,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: AppColor.gray.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(16)),
                    child: DataTable(columnSpacing: 30, columns: [
                      DataColumn(
                        label: Text(
                          'Period',
                          style: TextStyle(
                              color: AppColor.gray,
                              fontWeight: FontWeight.w400,
                              fontSize: 14),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Average',
                          style: TextStyle(
                              color: AppColor.gray,
                              fontWeight: FontWeight.w400,
                              fontSize: 14),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Max',
                          style: TextStyle(
                              color: AppColor.gray,
                              fontWeight: FontWeight.w400,
                              fontSize: 14),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Min',
                          style: TextStyle(
                              color: AppColor.gray,
                              fontWeight: FontWeight.w400,
                              fontSize: 14),
                        ),
                      ),
                    ], rows: [
                      DataRow(cells: [
                        DataCell(Text(
                          'Today',
                          style: TextStyle(
                              color: AppColor.gray,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        )),
                        DataCell(Text(
                          '28.2°C',
                          style: TextStyle(
                              color: AppColor.gray,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        )),
                        DataCell(Text(
                          '29.5°C',
                          style: TextStyle(
                              color: AppColor.gray,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        )),
                        DataCell(Text(
                          '27.1°C',
                          style: TextStyle(
                              color: AppColor.gray,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        )),
                      ]),
                      DataRow(cells: [
                        DataCell(Text(
                          'Yesterday',
                          style: TextStyle(
                              color: AppColor.gray,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        )),
                        DataCell(Text(
                          '27.8°C',
                          style: TextStyle(
                              color: AppColor.gray,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        )),
                        DataCell(Text(
                          '28.9°C',
                          style: TextStyle(
                              color: AppColor.gray,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        )),
                        DataCell(Text(
                          '26.8°C',
                          style: TextStyle(
                              color: AppColor.gray,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        )),
                      ]),
                      DataRow(cells: [
                        DataCell(Text(
                          'Past 3 Days',
                          style: TextStyle(
                              color: AppColor.gray,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        )),
                        DataCell(Text(
                          '28.5°C',
                          style: TextStyle(
                              color: AppColor.gray,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        )),
                        DataCell(Text(
                          '30.2°C',
                          style: TextStyle(
                              color: AppColor.gray,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        )),
                        DataCell(Text(
                          '26.5°C',
                          style: TextStyle(
                              color: AppColor.gray,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        )),
                      ]),
                      DataRow(cells: [
                        DataCell(Text(
                          'Past Week',
                          style: TextStyle(
                              color: AppColor.gray,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        )),
                        DataCell(Text(
                          '29.1°C',
                          style: TextStyle(
                              color: AppColor.gray,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        )),
                        DataCell(Text(
                          '31.0°C',
                          style: TextStyle(
                              color: AppColor.gray,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        )),
                        DataCell(Text(
                          '26.0°C',
                          style: TextStyle(
                              color: AppColor.gray,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        )),
                      ]),
                    ]),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
