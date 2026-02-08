import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../../core/theme/app_color.dart';

class ServerStatusWidget extends StatelessWidget {
  const ServerStatusWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Server Status',
              style: TextStyle(
                  color: AppColor.black,
                  fontSize: 25,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 20,
            ),
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 18, vertical: 15),
                              decoration: BoxDecoration(
                                  color: AppColor.green.withValues(alpha: 0.1),
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(color: AppColor.green)),
                              child: SvgPicture.asset(
                                'assets/icons/active.svg',
                                width: 25,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              '12',
                              style: TextStyle(
                                  color: AppColor.green,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              'Online',
                              style: TextStyle(
                                  color: AppColor.gray,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 18, vertical: 15),
                              decoration: BoxDecoration(
                                  color: AppColor.orange.withValues(alpha: 0.1),
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(color: AppColor.orange)),
                              child: SvgPicture.asset(
                                'assets/icons/warning.svg',
                                width: 25,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              '3',
                              style: TextStyle(
                                  color: AppColor.orange,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              'Warning',
                              style: TextStyle(
                                  color: AppColor.gray,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 18, vertical: 15),
                              decoration: BoxDecoration(
                                  color: AppColor.red.withValues(alpha: 0.1),
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(color: AppColor.red)),
                              child: SvgPicture.asset(
                                'assets/icons/server.svg',
                                width: 25,
                                color: AppColor.red,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              '2',
                              style: TextStyle(
                                  color: AppColor.red,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              'Offline',
                              style: TextStyle(
                                  color: AppColor.gray,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 18, vertical: 15),
                              decoration: BoxDecoration(
                                  color: AppColor.blue.withValues(alpha: 0.1),
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(color: AppColor.blue)),
                              child: SvgPicture.asset(
                                'assets/icons/server.svg',
                                width: 25,
                                color: AppColor.blue,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              '17',
                              style: TextStyle(
                                  color: AppColor.blue,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              'Total',
                              style: TextStyle(
                                  color: AppColor.gray,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Column(
                            children: [
                              Text(
                                'System Uptime',
                                style: TextStyle(
                                    color: AppColor.gray,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                '99.8%',
                                style: TextStyle(
                                    color: AppColor.black,
                                    fontSize: 25,
                                    fontWeight: FontWeight.w400),
                              )
                            ],
                          ),
                          Spacer(),
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 8, horizontal: 26),
                            decoration: BoxDecoration(
                                color: AppColor.blue.withValues(alpha: 0.1),
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(color: AppColor.blue)),
                            child: Row(
                              children: [
                                Text(
                                  'Stable',
                                  style: TextStyle(
                                      color: AppColor.blue,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
