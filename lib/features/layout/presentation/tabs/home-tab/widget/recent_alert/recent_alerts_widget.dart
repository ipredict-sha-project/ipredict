import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ipredict/core/routes_manager/routes/app_route_name.dart';

import '../../../../../../../core/theme/app_color.dart';

class RecentAlertsWidget extends StatelessWidget {
  const RecentAlertsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Recent Alerts',
                  style: TextStyle(
                      color: AppColor.black,
                      fontSize: 25,
                      fontWeight: FontWeight.w400),
                ),
                Spacer(),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, AppRouteName.alerts);
                  },
                  child: Text(
                    'View All',
                    style: TextStyle(
                        color: AppColor.blue,
                        fontSize: 20,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
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
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/icons/warning_red.svg' , width: 55,),
                      SizedBox(
                        width: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'High Temperature Detected',
                            style: TextStyle(
                                color: AppColor.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            'Server Room A - Rack 3',
                            style: TextStyle(
                                color: AppColor.gray,
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                      Spacer(),
                      Column(
                        children: [
                          Text('14:32' , style: TextStyle(color: AppColor.gray , fontSize: 14 , fontWeight: FontWeight.w400),),
                          Text('critical'.toUpperCase() , style: TextStyle(color: AppColor.red , fontSize: 16 , fontWeight: FontWeight.w400),)
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
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
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/icons/warning_red.svg' , width: 55,),
                      SizedBox(
                        width: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Abnormal Vibration Pattern',
                            style: TextStyle(
                                color: AppColor.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            'Production Floor - Machine #5',
                            style: TextStyle(
                                color: AppColor.gray,
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                      Spacer(),
                      Column(
                        children: [
                          Text('13:18' , style: TextStyle(color: AppColor.gray , fontSize: 14 , fontWeight: FontWeight.w400),),
                          Text('critical'.toUpperCase() , style: TextStyle(color: AppColor.red , fontSize: 16 , fontWeight: FontWeight.w400),)
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
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
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/icons/warning_yellow.svg' , width: 55,),
                      SizedBox(
                        width: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'High Humidity Warning',
                            style: TextStyle(
                                color: AppColor.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            'Server Room A - Rack 5',
                            style: TextStyle(
                                color: AppColor.gray,
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                      Spacer(),
                      Column(
                        children: [
                          Text('10:22' , style: TextStyle(color: AppColor.gray , fontSize: 14 , fontWeight: FontWeight.w400),),
                          Text('warning'.toUpperCase() , style: TextStyle(color: AppColor.orange , fontSize: 16 , fontWeight: FontWeight.w400),)
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
