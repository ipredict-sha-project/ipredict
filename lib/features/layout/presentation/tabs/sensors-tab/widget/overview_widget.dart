import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../core/theme/app_color.dart';

class OverviewWidget extends StatelessWidget {
  const OverviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 21),
                child: Text(
                  'Overview'.toUpperCase(),
                  style: TextStyle(
                      color: AppColor.gray,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  children: [
                    Text(
                      '6 Sensors Total',
                      style: TextStyle(
                          color: AppColor.black,
                          fontSize: 24,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                  decoration: BoxDecoration(
                      color: Color(0xffB9F8CF).withValues(alpha: 0.4),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: AppColor.green)),
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/active.svg',
                        width: 25,
                      ),
                      Text(
                        '4',
                        style: TextStyle(
                            color: AppColor.green,
                            fontSize: 20,
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        'Active'.toUpperCase(),
                        style: TextStyle(
                            color: AppColor.green,
                            fontSize: 10,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 24),
                  decoration: BoxDecoration(
                      color: Color(0xffFFD6A7).withValues(alpha: 0.4),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: AppColor.orange)),
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/warning.svg',
                        width: 25,
                      ),
                      Text(
                        '1',
                        style: TextStyle(
                            color: AppColor.orange,
                            fontSize: 20,
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        'Warning'.toUpperCase(),
                        style: TextStyle(
                            color: AppColor.orange,
                            fontSize: 10,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 17, vertical: 24),
                  decoration: BoxDecoration(
                      color: Color(0xffFFC9C9).withValues(alpha: 0.4),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: AppColor.red)),
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/non_active.svg',
                        width: 25,
                      ),
                      Text(
                        '1',
                        style: TextStyle(
                            color: AppColor.red,
                            fontSize: 20,
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        'Critical'.toUpperCase(),
                        style: TextStyle(
                            color: AppColor.red,
                            fontSize: 10,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 18, vertical: 24),
                  decoration: BoxDecoration(
                      color: Color(0xffD1D5DC).withValues(alpha: 0.4),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: AppColor.gray)),
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/offline.svg',
                        width: 25,
                      ),
                      Text(
                        '0',
                        style: TextStyle(
                            color: AppColor.gray,
                            fontSize: 20,
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        'Offline'.toUpperCase(),
                        style: TextStyle(
                            color: AppColor.gray,
                            fontSize: 10,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
