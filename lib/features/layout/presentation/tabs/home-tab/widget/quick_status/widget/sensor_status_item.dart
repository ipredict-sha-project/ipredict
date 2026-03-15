import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../../../core/theme/app_color.dart';

class SensorStatusItem extends StatelessWidget {
  final String title;
  final String value;
  final String status;
  final String icon;

  const SensorStatusItem({
    super.key,
    required this.title,
    required this.value,
    required this.status,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    Color statusColor;

    if (status == "Normal") {
      statusColor = AppColor.blue;
    } else if (status == "Warning") {
      statusColor = AppColor.orange;
    } else {
      statusColor = AppColor.red;
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColor.gray.withValues(alpha: 0.5),
            spreadRadius: 2,
            blurRadius: 8,
            offset: Offset(0, 4),
          )
        ],
        color: AppColor.white,
        border: Border.all(color: AppColor.gray_background),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 22, vertical: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: AppColor.gray_background,
            ),
            child: SizedBox(
              width: 35,
              height: 35,
              child: SvgPicture.asset(
                icon,
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: AppColor.gray,
                  fontSize: 20,
                ),
              ),
              Text(
                value,
                style: TextStyle(
                  color: AppColor.black,
                  fontSize: 25,
                ),
              ),
              SizedBox(height: 5),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: statusColor),
                  color: statusColor.withValues(alpha: 0.1),
                ),
                child: Text(
                  status,
                  style: TextStyle(
                    color: statusColor,
                    fontSize: 18,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
