import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../../../../../../../core/theme/app_color.dart';

class SystemHealthWidget extends StatelessWidget {
  final double temperature;
  final double vibration;
  final double airQuality;

  const SystemHealthWidget({
    super.key,
    required this.temperature,
    required this.vibration,
    required this.airQuality,
  });

  double calculateHealth() {
    double score = 100;

    if (temperature > 35) score -= 10;
    if (vibration > 0.2) score -= 10;
    if (airQuality > 200) score -= 5;

    return score / 100;
  }

  String getHealthStatus(double percent) {
    double value = percent * 100;

    if (value >= 80) return "Good";
    if (value >= 60) return "Warning";

    return "Critical";
  }

  Color getHealthColor(String status) {
    if (status == "Good") return AppColor.blue;

    if (status == "Warning") return AppColor.orange;

    return AppColor.red;
  }

  @override
  Widget build(BuildContext context) {
    double targetPercent = calculateHealth();

    return TweenAnimationBuilder<double>(
      tween: Tween(end: targetPercent),
      duration: Duration(milliseconds: 800),
      builder: (context, percent, child) {
        String status = getHealthStatus(percent);
        Color healthColor = getHealthColor(status);

        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: AppColor.gray.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 8,
                offset: Offset(0, 4),
              )
            ],
            color: AppColor.white,
            border: Border.all(color: AppColor.gray_background),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 41),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircularPercentIndicator(
                  radius: 80,
                  lineWidth: 10,
                  percent: percent,
                  center: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${(percent * 100).toInt()}%",
                        style: TextStyle(
                          color: AppColor.black,
                          fontSize: 50,
                        ),
                      ),
                      Text(
                        status,
                        style: TextStyle(
                          color: healthColor,
                          fontSize: 20,
                        ),
                      )
                    ],
                  ),
                  progressColor: healthColor,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "System Health",
                      style: TextStyle(
                        color: AppColor.black,
                        fontSize: 25,
                      ),
                    ),
                    Text(
                      status,
                      style: TextStyle(
                        color: healthColor,
                        fontSize: 35,
                      ),
                    ),
                    Text(
                      "All systems operating normally",
                      style: TextStyle(
                        color: AppColor.gray,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 26),
                      decoration: BoxDecoration(
                        color: healthColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: healthColor),
                      ),
                      child: Row(
                        children: [
                          Text(
                            "Status: ",
                            style: TextStyle(
                              color: healthColor,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            status,
                            style: TextStyle(
                              color: healthColor,
                              fontSize: 18,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
