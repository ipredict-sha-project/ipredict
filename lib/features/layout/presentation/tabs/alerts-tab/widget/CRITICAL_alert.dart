import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:ipredict/core/routes_manager/routes/app_route_name.dart';

import '../../../../../../core/theme/app_color.dart';

class CriticalAlert extends StatelessWidget {
  const CriticalAlert({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, AppRouteName.alert_details);
      },
      child: Container(
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
          border: Border(left: BorderSide(color: AppColor.red, width: 5)),
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
                        color: AppColor.red,
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
              Column(
                children: [
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                            top: 20, bottom: 20, left: 20, right: 90),
                        decoration: BoxDecoration(
                            color: AppColor.red.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: AppColor.red)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Current Value',
                              style: TextStyle(
                                  color: AppColor.gray,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              '78°C',
                              style: TextStyle(color: AppColor.red),
                            )
                          ],
                        ),
                      ),
                      Spacer(),
                      Container(
                        padding: EdgeInsets.only(
                            top: 20, bottom: 20, left: 20, right: 100),
                        decoration: BoxDecoration(
                            color: AppColor.gray.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: AppColor.gray)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Threshold',
                              style: TextStyle(
                                  color: AppColor.gray,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              '70°C',
                              style: TextStyle(color: AppColor.black),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 15,),
              Column(
                children: [
                  Row(
                    children: [
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 30),
                        decoration: BoxDecoration(
                          color: AppColor.blue,
                          border: Border.all(color: AppColor.blue),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.remove_red_eye_outlined,
                              color: AppColor.white,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'View Details',
                              style: TextStyle(
                                  color: AppColor.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                      ),
                      Spacer(),
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 25),
                        decoration: BoxDecoration(
                          color: AppColor.white,
                          border: Border.all(color: AppColor.gray),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.remove_red_eye_outlined,
                              color: AppColor.black,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Acknowledge',
                              style: TextStyle(
                                  color: AppColor.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(height: 15,),
            ],
          ),
        ),
      ),
    );
  }
}
