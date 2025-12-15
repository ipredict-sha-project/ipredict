import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../../core/theme/app_color.dart';

class DevicesWidget extends StatelessWidget {
  const DevicesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 440,
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
                  'Devices',
                  style: TextStyle(
                      color: AppColor.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: 146,
                height: 170,
                padding: EdgeInsets.all(17),
                decoration: BoxDecoration(
                    color: AppColor.gray_background,
                    borderRadius: BorderRadius.circular(16)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: AppColor.blue,
                          borderRadius: BorderRadius.circular(14)),
                      child: SvgPicture.asset('assets/icons/server.svg'),
                      width: 55,
                    ),
                    Text(
                      'Server Rack 1',
                      style: TextStyle(
                          color: AppColor.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      'Data Center',
                      style: TextStyle(
                          color: AppColor.gray,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      '5 sensors',
                      style: TextStyle(
                          color: AppColor.gray,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
              Container(
                width: 146,
                height: 170,
                padding: EdgeInsets.all(17),
                decoration: BoxDecoration(
                    color: AppColor.gray_background,
                    borderRadius: BorderRadius.circular(16)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: AppColor.blue,
                          borderRadius: BorderRadius.circular(14)),
                      child: SvgPicture.asset('assets/icons/server.svg'),
                      width: 55,
                    ),
                    Text(
                      'Cooling Unit 3',
                      style: TextStyle(
                          color: AppColor.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      'Hallway A',
                      style: TextStyle(
                          color: AppColor.gray,
                          fontSize: 14,
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
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: 146,
                height: 170,
                padding: EdgeInsets.all(17),
                decoration: BoxDecoration(
                    color: AppColor.gray_background,
                    borderRadius: BorderRadius.circular(16)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: AppColor.blue,
                          borderRadius: BorderRadius.circular(14)),
                      child: SvgPicture.asset('assets/icons/server.svg'),
                      width: 55,
                    ),
                    Text(
                      'Main Panel 02',
                      style: TextStyle(
                          color: AppColor.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      'Electrical Room',
                      style: TextStyle(
                          color: AppColor.gray,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      'Offline',
                      style: TextStyle(
                          color: AppColor.red,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
              Container(
                width: 146,
                height: 170,
                padding: EdgeInsets.all(17),
                decoration: BoxDecoration(
                    color: AppColor.gray_background,
                    borderRadius: BorderRadius.circular(16)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: AppColor.blue,
                          borderRadius: BorderRadius.circular(14)),
                      child: SvgPicture.asset('assets/icons/server.svg'),
                      width: 55,
                    ),
                    Text(
                      'Storage Vent 4',
                      style: TextStyle(
                          color: AppColor.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      'Storage',
                      style: TextStyle(
                          color: AppColor.gray,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      '2 sensors',
                      style: TextStyle(
                          color: AppColor.gray,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
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
