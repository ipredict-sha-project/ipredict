import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../../core/theme/app_color.dart';

class ServerStatusWidget extends StatelessWidget {
  const ServerStatusWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 260,
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
                  'Server Status',
                  style: TextStyle(
                      color: AppColor.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
              ),
              Spacer(),
              Row(
                children: [
                  Text(
                    '3 Online',
                    style: TextStyle(
                        color: AppColor.green,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                  VerticalDivider(
                    color: AppColor.black,
                    thickness: 2,
                  ),
                  Text(
                    '1 Offline',
                    style: TextStyle(
                        color: AppColor.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  )
                ],
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 48, vertical: 16),
                decoration: BoxDecoration(
                    color: AppColor.green,
                    borderRadius: BorderRadius.circular(16)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SvgPicture.asset('assets/icons/server.svg'),
                    Text(
                      'Server A',
                      style: TextStyle(
                          color: AppColor.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      'Room 101',
                      style: TextStyle(
                          color: AppColor.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      'Good',
                      style: TextStyle(
                          color: AppColor.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 48, vertical: 16),
                decoration: BoxDecoration(
                    color: AppColor.green,
                    borderRadius: BorderRadius.circular(16)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SvgPicture.asset('assets/icons/server.svg'),
                    Text(
                      'Server B',
                      style: TextStyle(
                          color: AppColor.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      'Data Center 1',
                      style: TextStyle(
                          color: AppColor.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      'Good',
                      style: TextStyle(
                          color: AppColor.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
              // Container(
              //   padding: EdgeInsets.symmetric(horizontal: 48 , vertical: 16),
              //   decoration: BoxDecoration(
              //     color: AppColor.red,
              //     borderRadius: BorderRadius.circular(16)
              //   ),
              //   child: Column(
              //     mainAxisAlignment: MainAxisAlignment.spaceAround,
              //     children: [
              //       Row(
              //         children: [
              //           SvgPicture.asset('assets/icons/server.svg'),
              //           Spacer(),
              //           SvgPicture.asset('assets/icons/warning_red_status.svg')
              //         ],
              //       ),
              //       Text('Server C' , style: TextStyle(color: AppColor.white , fontSize: 14 , fontWeight: FontWeight.w400),),
              //       Text('Room 202' , style: TextStyle(color: AppColor.white , fontSize: 12 , fontWeight: FontWeight.w400),),
              //       Text('Error (Overheat)' , style: TextStyle(color: AppColor.white , fontSize: 12 , fontWeight: FontWeight.w400),),
              //     ],
              //   ),
              // ),
              // Container(
              //   padding: EdgeInsets.symmetric(horizontal: 48 , vertical: 16),
              //   decoration: BoxDecoration(
              //       color: AppColor.green,
              //       borderRadius: BorderRadius.circular(16)
              //   ),
              //   child: Column(
              //     mainAxisAlignment: MainAxisAlignment.spaceAround,
              //     children: [
              //       SvgPicture.asset('assets/icons/server.svg'),
              //       Text('Server D' , style: TextStyle(color: AppColor.white , fontSize: 14 , fontWeight: FontWeight.w400),),
              //       Text('Lab Rack' , style: TextStyle(color: AppColor.white , fontSize: 12 , fontWeight: FontWeight.w400),),
              //       Text('Good' , style: TextStyle(color: AppColor.white , fontSize: 12 , fontWeight: FontWeight.w400),),
              //     ],
              //   ),
              // ),
            ],
          )
        ],
      ),
    );
  }
}
