import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../../../../core/theme/app_color.dart';

class ResolvedAlert extends StatelessWidget {
  const ResolvedAlert({super.key});

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
        border: Border(left: BorderSide(color: AppColor.green, width: 5)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'High Temperature Detected',
                  style: TextStyle(
                      color: AppColor.black,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                      color: AppColor.green,
                      borderRadius: BorderRadius.circular(16)),
                  child: Text(
                    'CRITICAL',
                    style: TextStyle(
                        color: AppColor.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 15),
                  ),
                )
              ],
            ),
            SizedBox(height: 5,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Temperature reached 78°C, exceeding',
                  style: TextStyle(
                      color: AppColor.gray,
                      fontSize: 15,
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  ' the safe limit of 70°C in Server Room A.',
                  style: TextStyle(
                      color: AppColor.gray,
                      fontSize: 15,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
            SizedBox(height: 20,),
            Column(
              children: [
                Row(
                  children: [
                    Row(
                      children: [
                        Container(
                            child: SvgPicture.asset(
                              'assets/icons/Temperature.svg',
                              color: AppColor.gray,
                              width: 12,
                            )),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                            child: Text(
                              'Temperature BME680',
                              style: TextStyle(
                                  color: AppColor.gray,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400),
                            ))
                      ],
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Row(
                      children: [
                        Container(
                            child: SvgPicture.asset(
                              'assets/icons/sensors.svg',
                              color: AppColor.gray,
                              width: 20,
                            )),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                            child: Text(
                              'TEMP-SRV-A01',
                              style: TextStyle(
                                  color: AppColor.gray,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400),
                            ))
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        Container(
                          child: Icon(
                            Iconsax.location_outline,
                            color: AppColor.gray,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                            child: Text(
                              'Server Room A - Rack 3',
                              style: TextStyle(
                                  color: AppColor.gray,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400),
                            ))
                      ],
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Row(
                      children: [
                        Container(
                            child: Icon(
                              Icons.access_time,
                              color: AppColor.gray,
                            )),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                            child: Text(
                              'Today - 14:32',
                              style: TextStyle(
                                  color: AppColor.gray,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400),
                            ))
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 15,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12
              ),
              decoration: BoxDecoration(
                  color: AppColor.green.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColor.green)),
              child: Row(
                children: [
                  Text('✓ Resolved by Sarah Johnson',style: TextStyle(color: AppColor.green, fontSize: 15), )
                ],
              ),
            ),
            SizedBox(height: 15,),
          ],
        ),
      ),
    );
  }
}
