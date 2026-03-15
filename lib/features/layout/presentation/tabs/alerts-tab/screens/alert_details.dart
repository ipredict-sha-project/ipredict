import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../../../../core/theme/app_color.dart';
import '../../../widgets/appbar_widget.dart';

import '../module/alert_module.dart';

import '../widget/alert_details_recommended_actions.dart';
import '../widget/alert_details_system_impact.dart';
import '../widget/alert_detils_root_cause_annlysis.dart';

class AlertDetails extends StatelessWidget {
  final AlertModel alert;
  final VoidCallback onBack;

  const AlertDetails({
    super.key,
    required this.alert,
    required this.onBack,
  });

  /// لون الـ alert
  Color getColor() {
    if (alert.status == "critical") return AppColor.red;
    if (alert.status == "warning") return AppColor.orange;
    return AppColor.green;
  }

  /// أيقونة الحساس
  String getSensorIcon() {
    if (alert.sensorName.toLowerCase().contains("temperature")) {
      return "assets/icons/Temperature.svg";
    }

    if (alert.sensorName.toLowerCase().contains("vibration")) {
      return "assets/icons/smoke.svg";
    }

    if (alert.sensorName.toLowerCase().contains("air")) {
      return "assets/icons/warning.svg";
    }

    return "assets/icons/warning.svg";
  }

  /// أيقونة الـ alert
  String getAlertIcon() {
    if (alert.status == "critical") {
      return "assets/icons/warning.svg";
    }

    if (alert.status == "warning") {
      return "assets/icons/warning.svg";
    }

    return "assets/icons/active.svg";
  }

  /// تنسيق التاريخ
  String formatDetected(DateTime time) {
    return "${time.day}/${time.month}/${time.year} at ${time.hour}:${time.minute.toString().padLeft(2, '0')}";
  }

  /// حساب مدة الـ alert
  String calculateDuration(DateTime time) {
    Duration diff = DateTime.now().difference(time);

    int hours = diff.inHours;
    int minutes = diff.inMinutes % 60;

    if (hours == 0) {
      return "$minutes minutes";
    }

    return "$hours hours $minutes minutes";
  }

  @override
  Widget build(BuildContext context) {
    Color color = getColor();

    return Scaffold(
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              /// APP BAR
              AppbarWidget(),

              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// BACK BUTTON
                    GestureDetector(
                      onTap: onBack,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                  color: AppColor.gray.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 8,
                                  offset: const Offset(0, 4))
                            ],
                            color: AppColor.white,
                            border:
                                Border.all(color: AppColor.gray_background)),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 13),
                          child: Icon(Icons.arrow_back_ios_new),
                        ),
                      ),
                    ),

                    const SizedBox(height: 30),

                    /// MAIN CARD
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: color, width: 2),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(.05),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          )
                        ],
                        color: AppColor.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            /// TITLE
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                                  decoration: BoxDecoration(
                                    color: color.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(16),
                                    border: Border.all(color: color),
                                  ),
                                  child: SvgPicture.asset(
                                    getAlertIcon(),
                                    width: 40,
                                    color: color,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        alert.title,
                                        style: const TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Row(
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 14, vertical: 6),
                                            decoration: BoxDecoration(
                                              color: color.withOpacity(.1),
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              border: Border.all(color: color),
                                            ),
                                            child: Text(
                                              alert.status.toUpperCase(),
                                              style: TextStyle(
                                                color: color,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 6),
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 14, vertical: 6),
                                            decoration: BoxDecoration(
                                              color:
                                                  Colors.grey.withOpacity(.2),
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            child: const Text(
                                              "OPEN",
                                              style: TextStyle(fontSize: 14),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 20),

                            /// DETECTED + DURATION
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(color: color),
                                color: color.withOpacity(.08),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Detected",
                                        style: TextStyle(color: AppColor.gray),
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        formatDetected(alert.time),
                                        style: TextStyle(
                                            color: color, fontSize: 16),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Duration",
                                        style: TextStyle(color: AppColor.gray),
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        calculateDuration(alert.time),
                                        style: TextStyle(
                                            color: color, fontSize: 16),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(height: 20),

                            const Divider(),

                            const SizedBox(height: 10),

                            /// SERVER
                            const Text(
                              "Affected Server",
                              style: TextStyle(color: AppColor.gray),
                            ),

                            const SizedBox(height: 10),

                            Row(
                              children: [
                                SvgPicture.asset(
                                  "assets/icons/server.svg",
                                  width: 20,
                                  color: AppColor.gray,
                                ),
                                const SizedBox(width: 10),
                                const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Production Server 01",
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    Text(
                                      "SRV-PROD-001",
                                      style: TextStyle(color: AppColor.gray),
                                    ),
                                  ],
                                ),
                              ],
                            ),

                            const SizedBox(height: 10),

                            Row(
                              children: [
                                const Icon(Iconsax.location_outline,
                                    color: AppColor.gray),
                                const SizedBox(width: 5),
                                Text(
                                  alert.location,
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ],
                            ),

                            const SizedBox(height: 20),

                            const Divider(),

                            const SizedBox(height: 10),

                            /// SENSOR
                            const Text(
                              "Affected Sensor",
                              style: TextStyle(color: AppColor.gray),
                            ),

                            const SizedBox(height: 10),

                            Row(
                              children: [
                                SvgPicture.asset(
                                  getSensorIcon(),
                                  width: 18,
                                  color: color,
                                ),
                                const SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      alert.sensorName,
                                      style: const TextStyle(fontSize: 18),
                                    ),
                                    Text(
                                      alert.sensorId,
                                      style:
                                          const TextStyle(color: AppColor.gray),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      "${alert.currentValue.toStringAsFixed(0)} ${alert.unit}",
                                      style: TextStyle(
                                        color: color,
                                        fontSize: 26,
                                      ),
                                    ),
                                    Text(
                                      "Threshold: ${alert.threshold.toStringAsFixed(0)} ${alert.unit}",
                                      style:
                                          const TextStyle(color: AppColor.gray),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    AlertDetilsRootCauseAnnlysis(alert: alert),

                    const SizedBox(height: 20),

                    AlertDetailsSystemImpact(alert: alert),

                    const SizedBox(height: 20),

                    AlertDetailsRecommendedActions(alert: alert),

                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
