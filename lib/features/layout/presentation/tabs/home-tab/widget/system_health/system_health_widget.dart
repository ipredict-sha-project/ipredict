import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../../../../../core/theme/app_color.dart';

class SystemHealthWidget extends StatelessWidget {
  const SystemHealthWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 41),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircularPercentIndicator(
                  radius: 80,
                  lineWidth: 10,
                  percent: 0.87,
                  center: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '87%',
                        style: TextStyle(
                            color: AppColor.black,
                            fontSize: 50,
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        'Good',
                        style: TextStyle(
                            color: AppColor.blue,
                            fontSize: 20,
                            fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                  progressColor: AppColor.blue,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'System Health',
                      style: TextStyle(
                          color: AppColor.black,
                          fontSize: 25,
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      'Good',
                      style: TextStyle(
                          color: AppColor.blue,
                          fontSize: 35,
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      'All systems operating normally',
                      style: TextStyle(
                          color: AppColor.gray,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 8 , horizontal: 26),
                        decoration: BoxDecoration(
                            color: AppColor.blue.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: AppColor.blue)),
                      child: Row(
                        children: [
                          Text('Status: ' , style: TextStyle(color: AppColor.blue , fontSize: 18 , fontWeight: FontWeight.w400),),
                          Text('Good' , style: TextStyle(color: AppColor.blue , fontSize: 18 , fontWeight: FontWeight.w400),)
                        ],
                      ),
                    ),
                    
                    // Text.rich(TextSpan(
                    //     text: 'Status',
                    //     style: TextStyle(
                    //         color: AppColor.gray,
                    //         fontSize: 20,
                    //         fontWeight: FontWeight.w400,
                    //         decorationColor: AppColor.gray),
                    //     children: [
                    //       TextSpan(
                    //         text: ' Stable',
                    //         style: TextStyle(
                    //             color: AppColor.blue,
                    //             fontSize: 20,
                    //             fontWeight: FontWeight.w400,
                    //             decorationColor: AppColor.blue),
                    //       )
                    //     ])),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
