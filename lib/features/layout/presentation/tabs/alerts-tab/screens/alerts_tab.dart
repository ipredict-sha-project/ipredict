import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ipredict/features/layout/presentation/widgets/appbar_widget.dart';

import '../../../../../../core/theme/app_color.dart';

class AlertsTab extends StatelessWidget {
  const AlertsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: Column(
        children: [
          AppbarWidget(),
          SizedBox(height: 30,),
          Center(
            child: Text(
              "Alerts",
              style: TextStyle(
                color: Color(0xff222222),
                fontSize: 28,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Critical Events & System Notifications",
            style: TextStyle(
                color: Color(0xff6A7282),
                fontSize: 14,
                fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 24),
                decoration: BoxDecoration(
                    color: AppColor.gray.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppColor.gray)),
                child: Column(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/bell.svg',
                      width: 25,
                    ),
                    Text(
                      '8',
                      style: TextStyle(
                          color: AppColor.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      'Total',
                      style: TextStyle(
                          color: AppColor.black,
                          fontSize: 10,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                decoration: BoxDecoration(
                    color: AppColor.red.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppColor.red)),
                child: Column(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/warning.svg',
                      width: 25,
                      color: AppColor.red,
                    ),
                    Text(
                      '8',
                      style: TextStyle(
                          color: AppColor.red,
                          fontSize: 20,
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      'warning',
                      style: TextStyle(
                          color: AppColor.black,
                          fontSize: 10,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                decoration: BoxDecoration(
                    color: AppColor.orange.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppColor.orange)),
                child: Column(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/warning.svg',
                      width: 25,
                    ),
                    Text(
                      '8',
                      style: TextStyle(
                          color: AppColor.orange,
                          fontSize: 20,
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      'warning',
                      style: TextStyle(
                          color: AppColor.black,
                          fontSize: 10,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 18, vertical: 24),
                decoration: BoxDecoration(
                    color: AppColor.green.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppColor.green)),
                child: Column(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/active.svg',
                      width: 25,
                    ),
                    Text(
                      '2',
                      style: TextStyle(
                          color: AppColor.green,
                          fontSize: 20,
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      'Resolved',
                      style: TextStyle(
                          color: AppColor.black,
                          fontSize: 10,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 24),
                decoration: BoxDecoration(
                    color: AppColor.gray.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppColor.gray)),
                child: Column(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/bell.svg',
                      width: 25,
                    ),
                    Text(
                      '8',
                      style: TextStyle(
                          color: AppColor.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      'Total',
                      style: TextStyle(
                          color: AppColor.black,
                          fontSize: 10,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 25,
          ),
          Container(
            width: 400,
            height: 300,
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
              border: Border(left:  BorderSide(
                  color: AppColor.red,
                  width: 5
              )),),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text('High Temperature Detected' , style: TextStyle(
                          color: AppColor.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w400
                      ),),
                      Spacer(),
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: AppColor.red,
                            borderRadius: BorderRadius.circular(16)
                        ),
                        child: Text('CRITICAL' , style: TextStyle(
                            color: AppColor.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 9
                        ),),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Temperature reached 78°C, exceeding' , style: TextStyle(
                          color: AppColor.gray,
                          fontSize: 12,
                          fontWeight: FontWeight.w400
                      ),),
                      Text(' the safe limit of 70°C in Server Room A.' , style: TextStyle(
                          color: AppColor.gray,
                          fontSize: 12,
                          fontWeight: FontWeight.w400
                      ),),
                    ],
                  )
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}