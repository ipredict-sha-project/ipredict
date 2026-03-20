import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/theme/app_color.dart';
import '../../../../data/models/alert_module.dart';
import '../../../manager/alerts/alerts_bloc.dart';
import '../../../manager/alerts/alerts_event.dart';

class AlertDetails extends StatelessWidget {
  final AlertModel alert;
  final VoidCallback onBack;

  const AlertDetails({
    super.key,
    required this.alert,
    required this.onBack,
  });

  Color getColor() {
    if (alert.status == "critical") return AppColor.red;
    if (alert.status == "warning") return AppColor.orange;
    return AppColor.green;
  }

  @override
  Widget build(BuildContext context) {
    final color = getColor();

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// BACK
            GestureDetector(
              onTap: onBack,
              child: const Icon(Icons.arrow_back),
            ),

            const SizedBox(height: 20),

            /// TITLE
            Text(
              alert.title,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            /// STATUS
            Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                alert.status.toUpperCase(),
                style: const TextStyle(color: Colors.white),
              ),
            ),

            const SizedBox(height: 20),

            /// DESCRIPTION
            Text(alert.description),

            const SizedBox(height: 20),

            /// VALUES
            Row(
              children: [
                Expanded(
                  child: _box(
                    "Current",
                    "${alert.currentValue} ${alert.unit}",
                    color,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _box(
                    "Threshold",
                    "${alert.threshold} ${alert.unit}",
                    AppColor.gray,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),

            /// 🔥 ACTIONS
            if (alert.status != "resolved")
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        context.read<AlertsBloc>().add(
                          ResolveAlertEvent(alert),
                        );

                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: AppColor.green,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: const Center(
                          child: Text(
                            "Resolve",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        context.read<AlertsBloc>().add(
                          AcknowledgeAlertEvent(alert),
                        );

                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(color: AppColor.gray),
                        ),
                        child: const Center(
                          child: Text("Acknowledge"),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            else
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: AppColor.green.withOpacity(.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Center(
                  child: Text(
                    "✓ This alert is resolved",
                    style: TextStyle(color: AppColor.green),
                  ),
                ),
              ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _box(String title, String value, Color color) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: color),
        color: color.withOpacity(.1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(color: AppColor.gray)),
          const SizedBox(height: 5),
          Text(
            value,
            style: TextStyle(
              color: color,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}