import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../../core/theme/app_color.dart';

class QuickStatusWidget extends StatelessWidget {
  const QuickStatusWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 250,
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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 21),
            child: Text(
              'Quick Status',
              style: TextStyle(
                  color: AppColor.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                child: Row(
                  children: [
                    SvgPicture.asset('assets/icons/Temperature.svg'),
                    Column(
                      children: [
                        Text(
                          'Temperature',
                          style: TextStyle(
                              color: AppColor.gray,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          '28.6°C',
                          style: TextStyle(
                              color: AppColor.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          'Normal',
                          style: TextStyle(
                              color: AppColor.green,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: [
                    SvgPicture.asset('assets/icons/Humidity.svg'),
                    Column(
                      children: [
                        Text(
                          'Humidity',
                          style: TextStyle(
                              color: AppColor.gray,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          '41%',
                          style: TextStyle(
                              color: AppColor.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          'Stable',
                          style: TextStyle(
                              color: AppColor.green,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                child: Row(
                  children: [
                    SvgPicture.asset('assets/icons/warning.svg'),
                    Column(
                      children: [
                        Text(
                          'Smoke Level',
                          style: TextStyle(
                              color: AppColor.gray,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          '210 ppm',
                          style: TextStyle(
                              color: AppColor.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          'Warning',
                          style: TextStyle(
                              color: AppColor.orange,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: [
                    SvgPicture.asset('assets/icons/Vibration.svg'),
                    Column(
                      children: [
                        Text(
                          'Vibration',
                          style: TextStyle(
                              color: AppColor.gray,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          '0.09 g',
                          style: TextStyle(
                              color: AppColor.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          'Normal',
                          style: TextStyle(
                              color: AppColor.green,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
