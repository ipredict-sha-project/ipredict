import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../core/theme/app_color.dart';

class Systemstatus extends StatelessWidget {
  const Systemstatus({super.key});

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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 21),
                child: Text(
                  'System Status'.toUpperCase(),
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
                      '5 Sensors',
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
            padding: const EdgeInsets.symmetric(vertical: 25 , horizontal: 21),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 17 , bottom: 17 , left: 17 , right: 125 ),
                      decoration: BoxDecoration(
                          color: AppColor.green.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: AppColor.green)),
                      child: Column(
                        children: [
                          Text('3' , style: TextStyle(color: AppColor.green , fontSize: 25 , fontWeight: FontWeight.bold),),
                          Text('Active'.toUpperCase() , style: TextStyle(color: AppColor.green , fontSize: 15),),
                        ],
                      ),
                    ),
                    Spacer(),
                    Container(
                      padding: EdgeInsets.only(top: 17 , bottom: 17 , left: 17 , right: 105),
                      decoration: BoxDecoration(
                          color: AppColor.orange.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: AppColor.orange)),
                      child: Column(
                        children: [
                          Text('1' , style: TextStyle(color: AppColor.orange , fontSize: 25 , fontWeight: FontWeight.bold),),
                          Text('Warning'.toUpperCase() , style: TextStyle(color: AppColor.orange , fontSize: 15),),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15,),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 17 , bottom: 17 , left: 17 , right: 110),
                      decoration: BoxDecoration(
                          color: AppColor.red.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: AppColor.red)),
                      child: Column(
                        children: [
                          Text('1' , style: TextStyle(color: AppColor.red , fontSize: 25 , fontWeight: FontWeight.bold),),
                          Text('Critical'.toUpperCase() , style: TextStyle(color: AppColor.red , fontSize: 15),),
                        ],
                      ),
                    ),
                    Spacer(),
                    Container(
                      padding: EdgeInsets.only(top: 17 , bottom: 17 , left: 17 , right: 115),
                      decoration: BoxDecoration(
                          color: AppColor.gray.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: AppColor.gray)),
                      child: Column(
                        children: [
                          Text('0' , style: TextStyle(color: AppColor.gray , fontSize: 25 , fontWeight: FontWeight.bold),),
                          Text('Offline'.toUpperCase() , style: TextStyle(color: AppColor.gray , fontSize: 15),),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
