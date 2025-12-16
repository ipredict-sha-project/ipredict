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
            children: [
              Container(
                width: 85,
                height: 106,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 8,
                        spreadRadius: 2,
                        offset: Offset(0, 4))
                  ],
                  color: Color(0xffFFFFFF),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset("assets/icons/bell.svg"),
                    Text(
                      "8",
                      style: TextStyle(
                        color: Color(0xff222222),
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Total",
                      style: TextStyle(
                          color: Color(0xff6A7282),
                          fontSize: 9,
                          fontWeight: FontWeight.w400),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                width: 85,
                height: 106,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 8,
                        spreadRadius: 2,
                        offset: Offset(0, 4))
                  ],
                  color: Color(0xffFFE2E2),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset("assets/icons/warning.svg" , color: AppColor.red,),
                    Text(
                      "3",
                      style: TextStyle(
                        color: Color(0xffE7000B),
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Critical",
                      style: TextStyle(
                          color: Color(0xff6A7282),
                          fontSize: 9,
                          fontWeight: FontWeight.w400),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                width: 85,
                height: 106,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 8,
                        spreadRadius: 2,
                        offset: Offset(0, 4))
                  ],
                  color: Color(0xffFFEDD4),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset("assets/icons/warning.svg"),
                    Text(
                      "3",
                      style: TextStyle(
                        color: Color(0xffF54900),
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Warning",
                      style: TextStyle(
                          color: Color(0xff6A7282),
                          fontSize: 9,
                          fontWeight: FontWeight.w400),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                width: 85,
                height: 106,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 8,
                        spreadRadius: 2,
                        offset: Offset(0, 4))
                  ],
                  color: Color(0xffDCFCE7),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset("assets/icons/active.svg"),
                    Text(
                      "2",
                      style: TextStyle(
                        color: Color(0xff00A63E),
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Resolved",
                      style: TextStyle(
                          color: Color(0xff6A7282),
                          fontSize: 9,
                          fontWeight: FontWeight.w400),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                width: 85,
                height: 106,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 8,
                        spreadRadius: 2,
                        offset: Offset(0, 4))
                  ],
                  color: Color(0xffFFFFFF),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset("assets/icons/bell.svg"),
                    Text(
                      "2",
                      style: TextStyle(
                        color: Color(0xff2962FF),
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Unread",
                      style: TextStyle(
                          color: Color(0xff6A7282),
                          fontSize: 9,
                          fontWeight: FontWeight.w400),
                    )
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 25,
          ),
          TextField(
            decoration: InputDecoration(
                hintText: "Search alerts by sensor, device, or location",
                border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
                hintStyle: TextStyle(
                  color: Color(0xff6C757D),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                )),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Container(
                width: 80,
                height: 67,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: CupertinoButton(
                      borderRadius: BorderRadius.circular(25),
                      color: Color(0xff1E7FC8),
                      child: Text(
                        "All",
                        style: TextStyle(
                            color: Color(0xffFFFFFF),
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                      onPressed: () {}),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                width: 90,
                height: 50,
                child: CupertinoButton(
                    borderRadius: BorderRadius.circular(25),
                    color: Color(0xffFFFFFF),
                    child: Text(
                      "Critical",
                      style: TextStyle(
                          color: Color(0xff4A5565),
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                    onPressed: () {}),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                width: 90,
                height: 50,
                child: CupertinoButton(
                    borderRadius: BorderRadius.circular(25),
                    color: Color(0xffFFFFFF),
                    child: Text(
                      "Warning",
                      style: TextStyle(
                          color: Color(0xff4A5565),
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                    onPressed: () {}),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                width: 90,
                height: 50,
                child: CupertinoButton(
                    borderRadius: BorderRadius.circular(25),
                    color: Color(0xffFFFFFF),
                    child: Text(
                      "Resolved",
                      style: TextStyle(
                          color: Color(0xff4A5565),
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                    onPressed: () {}),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                width: 90,
                height: 50,
                child: CupertinoButton(
                    borderRadius: BorderRadius.circular(25),
                    color: Color(0xffFFFFFF),
                    child: Text(
                      "Temperature",
                      style: TextStyle(
                          color: Color(0xff4A5565),
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                    onPressed: () {}),
              ),
            ],
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