import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../core/theme/app_color.dart';
import '../module/alert_module.dart';

class AlertDetailsRecommendedActions extends StatelessWidget {
  final AlertModel alert;

  const AlertDetailsRecommendedActions({
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
                    color: AppColor.green.withOpacity(.1),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppColor.green),
                  ),
                  child: SvgPicture.asset(
                    'assets/icons/security.svg',
                    color: AppColor.green,
                    width: 20,
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Recommended Actions',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Prioritized response plan',
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

            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColor.red.withOpacity(.1),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColor.red),
              ),
              child: Text(
                "Inspect ${alert.sensorName} sensor immediately.",
              ),
            ),

            const SizedBox(height: 10),

            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColor.orange.withOpacity(.1),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColor.orange),
              ),
              child: Text(
                "Reduce system load to prevent ${alert.unit} increase.",
              ),
            ),

            const SizedBox(height: 10),

            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColor.yellow.withOpacity(.1),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColor.yellow),
              ),
              child: const Text(
                "Schedule full system diagnostics within 24 hours.",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
