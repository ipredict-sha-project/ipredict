import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../../../../../core/theme/app_color.dart';

class SystemHealthWidget extends StatelessWidget {
  const SystemHealthWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 170,
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircularPercentIndicator(
                radius: 60.0,
                lineWidth: 10,
                percent: 0.87,
                center: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '87%',
                      style: TextStyle(
                          color: AppColor.black,
                          fontSize: 36,
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      'Good',
                      style: TextStyle(
                          color: AppColor.gray,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    )
                  ],
                ),
                progressColor: AppColor.blue,
              ),
              Column(
                children: [
                  Text(
                    'System Health',
                    style: TextStyle(
                        color: AppColor.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                  Text(
                    'Good',
                    style: TextStyle(
                        color: AppColor.blue,
                        fontSize: 28,
                        fontWeight: FontWeight.w400),
                  ),
                  Text.rich(TextSpan(
                      text: 'Status',
                      style: TextStyle(
                          color: AppColor.gray,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          decorationColor: AppColor.gray),
                      children: [
                        TextSpan(
                          text: ' Stable',
                          style: TextStyle(
                              color: AppColor.blue,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              decorationColor: AppColor.blue),
                        )
                      ])),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
