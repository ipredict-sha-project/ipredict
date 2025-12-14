import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ipredict/core/theme/app_color.dart';

import '../../../../../../core/widget/custoum_btn.dart';
import '../../../widgets/appbar_widget.dart';

class DevicesTab extends StatelessWidget {
  const DevicesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.white,
        body: SafeArea(
            child: Column(children: [
          AppbarWidget(),
          SizedBox(
            height: 40,
          ),
          Text(
            "Select Device",
            style: TextStyle(
              color: Color(0xff1A1A1A),
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 236,
            width: 350,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: AppColor.gray.withValues(alpha: 0.5),
                    spreadRadius: 2,
                    blurRadius: 8,
                    offset: Offset(0, 4))
              ],
              color: AppColor.white,
              image:
                  DecorationImage(image: AssetImage("assets/images/scan.png")),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Scan QR Code",
                  style: TextStyle(
                      color: Color(0xff6C757D),
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide:
                              BorderSide(color: AppColor.gray, width: 1)),
                      // prefixIcon: Icon(Icons.mail_outline),
                      hintText: 'Device ID',
                      hintStyle: TextStyle(color: AppColor.gray),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColor.gray),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      fillColor: AppColor.white,
                      filled: true),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide:
                              BorderSide(color: AppColor.gray, width: 1)),
                      // prefixIcon: Icon(Icons.mail_outline),
                      hintText: 'Password',
                      hintStyle: TextStyle(color: AppColor.gray),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColor.gray),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      fillColor: AppColor.white,
                      filled: true),
                ),
                SizedBox(
                  height: 20,
                ),
                CustoumBtn(
                  text: 'Add Device',
                  onTab: () {},
                ),
              ],
            ),
          )
        ])));
  }
}
