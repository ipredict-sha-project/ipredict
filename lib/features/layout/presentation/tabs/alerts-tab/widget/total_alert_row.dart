import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../core/theme/app_color.dart';

class TotalAlertRow extends StatelessWidget {
  const TotalAlertRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 21, vertical: 13),
          decoration: BoxDecoration(
              color: AppColor.gray.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColor.gray)),
          child: Column(
            children: [
              SvgPicture.asset(
                'assets/icons/bell.svg',
                width: 25,
              ),
              Text(
                '8',
                style: TextStyle(
                    color: AppColor.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w400),
              ),
              Text(
                'Total',
                style: TextStyle(
                    color: AppColor.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 13),
          decoration: BoxDecoration(
              color: AppColor.red.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColor.red)),
          child: Column(
            children: [
              SvgPicture.asset(
                'assets/icons/warning.svg',
                width: 25,
                color: AppColor.red,
              ),
              Text(
                '8',
                style: TextStyle(
                    color: AppColor.red,
                    fontSize: 20,
                    fontWeight: FontWeight.w400),
              ),
              Text(
                'warning',
                style: TextStyle(
                    color: AppColor.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 13),
          decoration: BoxDecoration(
              color: AppColor.orange.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColor.orange)),
          child: Column(
            children: [
              SvgPicture.asset(
                'assets/icons/warning.svg',
                width: 25,
              ),
              Text(
                '8',
                style: TextStyle(
                    color: AppColor.orange,
                    fontSize: 20,
                    fontWeight: FontWeight.w400),
              ),
              Text(
                'warning',
                style: TextStyle(
                    color: AppColor.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 13),
          decoration: BoxDecoration(
              color: AppColor.green.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColor.green)),
          child: Column(
            children: [
              SvgPicture.asset(
                'assets/icons/active.svg',
                width: 25,
              ),
              Text(
                '2',
                style: TextStyle(
                    color: AppColor.green,
                    fontSize: 20,
                    fontWeight: FontWeight.w400),
              ),
              Text(
                'Resolved',
                style: TextStyle(
                    color: AppColor.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 21, vertical: 13),
          decoration: BoxDecoration(
              color: AppColor.gray.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColor.gray)),
          child: Column(
            children: [
              SvgPicture.asset(
                'assets/icons/bell.svg',
                width: 25,
              ),
              Text(
                '8',
                style: TextStyle(
                    color: AppColor.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w400),
              ),
              Text(
                'Total',
                style: TextStyle(
                    color: AppColor.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
