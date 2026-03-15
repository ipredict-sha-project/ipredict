import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../core/theme/app_color.dart';
import '../module/alert_module.dart';

class AlertDetailsSystemImpact extends StatelessWidget {
  final AlertModel alert;

  const AlertDetailsSystemImpact({
    super.key,
    required this.alert,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColor.white,
        border: Border.all(color: AppColor.gray_background),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// HEADER
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: AppColor.orange.withOpacity(.1),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppColor.orange),
                  ),
                  child: SvgPicture.asset(
                    'assets/icons/warning.svg',
                    color: AppColor.orange,
                    width: 20,
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'System Impact',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Current and predicted effects',
                      style: TextStyle(
                        color: AppColor.gray,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 15),

            /// RISK
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColor.orange.withOpacity(.1),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColor.orange),
              ),
              child: Row(
                children: [
                  const Text(
                    "Risk Level:",
                    style: TextStyle(
                      color: AppColor.gray,
                      fontSize: 18,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    alert.status.toUpperCase(),
                    style: const TextStyle(
                      color: AppColor.orange,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 15),

            const Text(
              "Affected Components:",
              style: TextStyle(
                color: AppColor.gray,
                fontSize: 18,
              ),
            ),

            const SizedBox(height: 5),

            Text("${alert.sensorName} sensor readings unstable"),

            const SizedBox(height: 5),

            Text("Server location: ${alert.location}"),

            const SizedBox(height: 5),

            Text("Threshold exceeded: ${alert.threshold} ${alert.unit}"),
          ],
        ),
      ),
    );
  }
}
