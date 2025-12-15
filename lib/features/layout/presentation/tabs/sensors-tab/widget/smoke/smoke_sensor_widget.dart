import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

import '../../../../../../../core/theme/app_color.dart';

class SmokeSensorWidget extends StatelessWidget {
  const SmokeSensorWidget({super.key});

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
                        'Smoke Sensor',
                        style: TextStyle(
                            color: AppColor.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        '(MQ-2)',
                        style: TextStyle(
                            color: AppColor.gray,
                            fontSize: 12,
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
                    child: SvgPicture.asset('assets/icons/smoke.svg'),
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
                          'MQ2-004',
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
                          'Production Floor - Zone C',
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
                          '⏱️ 30 secs ago',
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
                '52 PPM',
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
                    color: AppColor.red.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(26),
                    border: Border.all(color: AppColor.red)),
                child: Text(
                  'Critical',
                  style: TextStyle(
                      color: AppColor.red,
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
                          '42 PPM',
                          style: TextStyle(
                              color: AppColor.gray,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        )),
                        DataCell(Text(
                          '55 PPM',
                          style: TextStyle(
                              color: AppColor.gray,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        )),
                        DataCell(Text(
                          '18 PPM',
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
                          '25 PPM',
                          style: TextStyle(
                              color: AppColor.gray,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        )),
                        DataCell(Text(
                          '38 PPM',
                          style: TextStyle(
                              color: AppColor.gray,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        )),
                        DataCell(Text(
                          '15 PPM',
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
                          '28 PPM',
                          style: TextStyle(
                              color: AppColor.gray,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        )),
                        DataCell(Text(
                          '45 PPM',
                          style: TextStyle(
                              color: AppColor.gray,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        )),
                        DataCell(Text(
                          '12 PPM',
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
                          '22 PPM',
                          style: TextStyle(
                              color: AppColor.gray,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        )),
                        DataCell(Text(
                          '40 PPM',
                          style: TextStyle(
                              color: AppColor.gray,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        )),
                        DataCell(Text(
                          '10 PPM',
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
