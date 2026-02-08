import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ipredict/core/routes_manager/routes/app_route_name.dart';

import '../../../../../../../core/theme/app_color.dart';

class QuickStatusWidget extends StatelessWidget {
  const QuickStatusWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, AppRouteName.sensor);
      },
      child: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Quick Status',
                style: TextStyle(
                    color: AppColor.black,
                    fontSize: 25,
                    fontWeight: FontWeight.w400),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                    child: Row(
                      children: [
                        Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 22, vertical: 12),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                boxShadow: [
                                  BoxShadow(
                                      color:
                                          AppColor.gray.withValues(alpha: 0.5),
                                      spreadRadius: 2,
                                      blurRadius: 8,
                                      offset: Offset(0, 4))
                                ],
                                color: AppColor.gray_background
                                    .withValues(alpha: 0.9),
                                border: Border.all(
                                    color: AppColor.gray_background)),
                            child: SvgPicture.asset(
                              'assets/icons/Temperature.svg',
                              width: 20,
                            )),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Temperature',
                              style: TextStyle(
                                  color: AppColor.gray,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              '28.6°C',
                              style: TextStyle(
                                  color: AppColor.black,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 18),
                              decoration: BoxDecoration(
                                  color: AppColor.blue.withValues(alpha: 0.1),
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(color: AppColor.blue)),
                              child: Text(
                                'Normal',
                                style: TextStyle(
                                    color: AppColor.blue,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
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
                    child: Row(
                      children: [
                        Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 14, vertical: 16),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                boxShadow: [
                                  BoxShadow(
                                      color:
                                          AppColor.gray.withValues(alpha: 0.5),
                                      spreadRadius: 2,
                                      blurRadius: 8,
                                      offset: Offset(0, 4))
                                ],
                                color: AppColor.gray_background
                                    .withValues(alpha: 0.9),
                                border: Border.all(
                                    color: AppColor.gray_background)),
                            child: SvgPicture.asset(
                              'assets/icons/smoke.svg',
                              width: 45,
                            )),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Vibration',
                              style: TextStyle(
                                  color: AppColor.gray,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              '0.09 g',
                              style: TextStyle(
                                  color: AppColor.black,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 18),
                              decoration: BoxDecoration(
                                  color: AppColor.blue.withValues(alpha: 0.1),
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(color: AppColor.blue)),
                              child: Text(
                                'Normal',
                                style: TextStyle(
                                    color: AppColor.blue,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
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
                    child: Row(
                      children: [
                        Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 16),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                boxShadow: [
                                  BoxShadow(
                                      color:
                                      AppColor.gray.withValues(alpha: 0.5),
                                      spreadRadius: 2,
                                      blurRadius: 8,
                                      offset: Offset(0, 4))
                                ],
                                color: AppColor.gray_background
                                    .withValues(alpha: 0.9),
                                border: Border.all(
                                    color: AppColor.gray_background)),
                            child: SvgPicture.asset(
                              'assets/icons/warning.svg',
                              width: 40,
                            )),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Air Quality ',
                              style: TextStyle(
                                  color: AppColor.gray,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              '210 IAQ',
                              style: TextStyle(
                                  color: AppColor.black,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 18),
                              decoration: BoxDecoration(
                                  color: AppColor.orange.withValues(alpha: 0.1),
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(color: AppColor.orange)),
                              child: Text(
                                'Warning',
                                style: TextStyle(
                                    color: AppColor.orange,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
