import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/theme/app_color.dart';

class AppbarWidget extends StatelessWidget {
  const AppbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          padding: EdgeInsets.only(top: 20, bottom: 20, left: 16),
          decoration: BoxDecoration(color: Color(0xff155DFC)),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "iPredict",
                    style: TextStyle(
                        color: AppColor.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Real-Time Monitoring System",
                    style: TextStyle(
                        color: AppColor.gray_background,
                        fontSize: 18,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              Spacer(),
              Row(
                children: [
                  Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: AppColor.white.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(360)),
                      child: SvgPicture.asset("assets/icons/alarm.svg")),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: AppColor.white.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(360)),
                      child: SvgPicture.asset("assets/icons/profile.svg")),
                  SizedBox(
                    width: 20,
                  ),
                ],
              )
            ],
          )),
    );

    // AppBar(
    //   backgroundColor: Color(0xff155DFC),
    //   title: Column(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: [
    //       Text(
    //         "iPredict",
    //         style: TextStyle(
    //             color: AppColor.white,
    //             fontSize: 22,
    //             fontWeight: FontWeight.w400),
    //       ),
    //       SizedBox(
    //         height: 5,
    //       ),
    //       Text(
    //         "Real-Time Monitoring System",
    //         style: TextStyle(
    //             color: AppColor.gray_background,
    //             fontSize: 18,
    //             fontWeight: FontWeight.w400),
    //       ),
    //     ],
    //   ),
    //   actions: [
    //     SvgPicture.asset("assets/icons/alarm.svg"),
    //     SizedBox(
    //       width: 20,
    //     ),
    //     SvgPicture.asset("assets/icons/profile.svg"),
    //     SizedBox(
    //       width: 20,
    //     ),
    //   ],
    // ),
  }
}
