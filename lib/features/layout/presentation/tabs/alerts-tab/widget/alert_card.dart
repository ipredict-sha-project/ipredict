import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/theme/app_color.dart';

import '../../../../data/models/alert_module.dart';
import '../screens/alert_details.dart';

import '../../../manager/alerts/alerts_bloc.dart';
import '../../../manager/alerts/alerts_event.dart';

class AlertCard extends StatelessWidget {
  final AlertModel alert;

  const AlertCard({
    super.key,
    required this.alert,
  });

  Color getColor() {
    if (alert.status == "critical") return AppColor.red;
    if (alert.status == "warning") return AppColor.orange;
    return AppColor.green;
  }

  String formatTime(DateTime time) {
    final now = DateTime.now();
    final yesterday = now.subtract(const Duration(days: 1));

    if (time.day == now.day &&
        time.month == now.month &&
        time.year == now.year) {
      return "Today - ${time.hour}:${time.minute.toString().padLeft(2, '0')}";
    }

    if (time.day == yesterday.day &&
        time.month == yesterday.month &&
        time.year == yesterday.year) {
      return "Yesterday - ${time.hour}:${time.minute.toString().padLeft(2, '0')}";
    }

    return "${time.hour}:${time.minute.toString().padLeft(2, '0')}";
  }

  @override
  Widget build(BuildContext context) {
    Color color = getColor();

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AlertDetails(
              alert: alert,
              onBack: () {
                Navigator.pop(context);
              },
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(18),
          border: Border(
            left: BorderSide(color: color, width: 5),
          ),
          boxShadow: [
            BoxShadow(
              color: AppColor.black.withOpacity(.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// TITLE + STATUS
              Row(
                children: [
                  Expanded(
                    child: Text(
                      alert.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Text(
                      alert.status.toUpperCase(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  )
                ],
              ),

              const SizedBox(height: 8),

              /// DESCRIPTION
              Text(
                alert.description,
                style: TextStyle(color: AppColor.gray),
              ),

              const SizedBox(height: 15),

              /// SENSOR INFO
              Row(
                children: [
                  const Icon(Icons.sensors, size: 18),
                  const SizedBox(width: 6),
                  Text(alert.sensorName),
                  const SizedBox(width: 10),
                  Text(
                    alert.sensorId,
                    style: TextStyle(color: AppColor.gray),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              /// LOCATION + TIME
              Row(
                children: [
                  const Icon(Icons.location_on_outlined, size: 18),
                  const SizedBox(width: 5),
                  Expanded(child: Text(alert.location)),
                  const Icon(Icons.access_time, size: 18),
                  const SizedBox(width: 5),
                  Text(formatTime(alert.time)),
                ],
              ),

              const SizedBox(height: 18),

              /// VALUES
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(color: color),
                        color: color.withOpacity(.1),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Current Value",
                            style: TextStyle(
                              color: AppColor.gray,
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            "${alert.currentValue.toStringAsFixed(0)} ${alert.unit}",
                            style: TextStyle(
                              fontSize: 18,
                              color: color,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(color: AppColor.gray),
                        color: AppColor.gray.withOpacity(.05),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Threshold",
                            style: TextStyle(
                              color: AppColor.gray,
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            "${alert.threshold.toStringAsFixed(0)} ${alert.unit}",
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 18),

              /// RESOLVED VIEW
              if (alert.status == "resolved")
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    color: AppColor.green.withOpacity(.1),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColor.green),
                  ),
                  child: Center(
                    child: Text(
                      "✓ Resolved by ${alert.resolvedBy ?? "System"}",
                      style: TextStyle(
                        color: AppColor.green,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                )
              else
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 45,
                        decoration: BoxDecoration(
                          color: AppColor.blue,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: const Center(
                          child: Text(
                            "View Details",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          if (alert.status == "critical") {
                            context.read<AlertsBloc>().add(
                              ResolveAlertEvent(alert),
                            );
                          } else {
                            context.read<AlertsBloc>().add(
                              AcknowledgeAlertEvent(alert),
                            );
                          }
                        },
                        child: Container(
                          height: 45,
                          decoration: BoxDecoration(
                            color: alert.status == "critical"
                                ? AppColor.green
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(color: AppColor.gray),
                          ),
                          child: Center(
                            child: Text(
                              alert.status == "critical"
                                  ? "Resolve"
                                  : "Acknowledge",
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
            ],
          ),
        ),
      ),
    );
  }
}
