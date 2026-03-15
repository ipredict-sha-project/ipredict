import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../core/theme/app_color.dart';
import '../module/alert_module.dart';

class AlertDetilsRootCauseAnnlysis extends StatelessWidget {
  final AlertModel alert;

  const AlertDetilsRootCauseAnnlysis({
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
                    color: AppColor.blue.withOpacity(.1),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppColor.blue),
                  ),
                  child: SvgPicture.asset(
                    'assets/icons/help.svg',
                    color: AppColor.blue,
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Root Cause Analysis',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w400,
                        color: AppColor.black,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'AI-powered diagnosis',
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

            /// AI ANALYSIS
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: AppColor.blue.withOpacity(.1),
                border: Border.all(color: AppColor.blue),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 21,
                  vertical: 15,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      alert.title,
                      style: const TextStyle(
                        color: AppColor.black,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      alert.description,
                      style: const TextStyle(
                        color: AppColor.gray,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 15),

            /// FACTORS
            const Text(
              'Contributing Factors:',
              style: TextStyle(
                color: AppColor.gray,
                fontSize: 20,
              ),
            ),

            const SizedBox(height: 5),

            Text(
              "${alert.sensorName} abnormal reading detected",
              style: const TextStyle(fontSize: 15),
            ),

            const SizedBox(height: 5),

            Text(
              "Sensor ID: ${alert.sensorId}",
              style: const TextStyle(fontSize: 15),
            ),

            const SizedBox(height: 5),

            Text(
              "Location: ${alert.location}",
              style: const TextStyle(fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}
