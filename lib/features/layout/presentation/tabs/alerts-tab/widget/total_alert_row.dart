import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../../core/theme/app_color.dart';
import 'alert_stat_box.dart';

class TotalAlertRow extends StatelessWidget {

  final int total;
  final int critical;
  final int warning;
  final int resolved;
  final int unread;

  const TotalAlertRow({
    super.key,
    required this.total,
    required this.critical,
    required this.warning,
    required this.resolved,
    required this.unread,
  });

  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,

      children: [

        AlertStatBox(
          icon: 'assets/icons/bell.svg',
          number: total,
          label: "Total",
          color: AppColor.gray,
        ),

        AlertStatBox(
          icon: 'assets/icons/warning.svg',
          number: critical,
          label: "Critical",
          color: AppColor.red,
        ),

        AlertStatBox(
          icon: 'assets/icons/warning.svg',
          number: warning,
          label: "Warning",
          color: AppColor.orange,
        ),

        AlertStatBox(
          icon: 'assets/icons/active.svg',
          number: resolved,
          label: "Resolved",
          color: AppColor.green,
        ),

        AlertStatBox(
          icon: 'assets/icons/bell.svg',
          number: unread,
          label: "Unread",
          color: AppColor.blue,
        ),

      ],
    );
  }
}