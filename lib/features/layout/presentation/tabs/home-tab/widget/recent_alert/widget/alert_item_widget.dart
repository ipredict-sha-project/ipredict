import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../../../../core/theme/app_color.dart';

class AlertItemWidget extends StatelessWidget {
  final String title;
  final String location;
  final String time;
  final String severity;
  final String icon;

  const AlertItemWidget({
    super.key,
    required this.title,
    required this.location,
    required this.time,
    required this.severity,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    Color severityColor =
        severity == "critical" ? AppColor.red : AppColor.orange;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColor.white,
        border: Border.all(color: AppColor.gray_background),
      ),
      child: Row(
        children: [
          SvgPicture.asset(icon, width: 55),
          SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: AppColor.black,
                  fontSize: 18,
                ),
              ),
              Text(
                location,
                style: TextStyle(
                  color: AppColor.gray,
                  fontSize: 16,
                ),
              )
            ],
          ),
          Spacer(),
          Column(
            children: [
              Text(
                time,
                style: TextStyle(color: AppColor.gray),
              ),
              Text(
                severity.toUpperCase(),
                style: TextStyle(color: severityColor),
              )
            ],
          )
        ],
      ),
    );
  }
}
