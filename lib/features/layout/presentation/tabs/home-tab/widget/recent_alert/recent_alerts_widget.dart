import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../core/theme/app_color.dart';

import '../../../../manager/alerts/alerts_bloc.dart';
import '../../../../manager/alerts/alerts_state.dart';

class RecentAlertsWidget extends StatelessWidget {
  final VoidCallback onViewAll;

  const RecentAlertsWidget({
    super.key,
    required this.onViewAll,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AlertsBloc, AlertsState>(
      builder: (context, state) {
        if (state is! AlertsLoaded) {
          return const SizedBox();
        }

        final alerts = state.alerts.take(3).toList();

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// HEADER (زي ما هو)
              Row(
                children: [
                  const Text(
                    'Recent Alerts',
                    style: TextStyle(
                      color: AppColor.black,
                      fontSize: 25,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: onViewAll,
                    child: const Text(
                      'View All',
                      style: TextStyle(
                        color: AppColor.blue,
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              /// ALERTS LIST (UI الجديد)
              ...alerts.map((alert) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: _alertItem(alert),
                );
              }).toList(),
            ],
          ),
        );
      },
    );
  }

  Widget _alertItem(alert) {
    final isCritical = alert.status.toLowerCase() == "critical";
    final color = isCritical ? AppColor.red : AppColor.orange;

    final icon = _getIcon(alert);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColor.white,
        border: Border.all(color: AppColor.gray_background),
        boxShadow: [
          BoxShadow(
            color: AppColor.gray.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Row(
          children: [
            /// ICON
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                color: Colors.white,
                size: 22,
              ),
            ),

            const SizedBox(width: 12),

            /// TEXT
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    alert.title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    alert.location,
                    style: const TextStyle(
                      color: AppColor.gray,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),

            /// RIGHT SIDE
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  _formatTime(alert.time),
                  style: const TextStyle(
                    color: AppColor.gray,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  alert.status.toUpperCase(),
                  style: TextStyle(
                    color: color,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// ICON LOGIC
  IconData _getIcon(alert) {
    final text = (alert.title + alert.sensorName).toLowerCase();

    if (text.contains("temperature")) {
      return Icons.thermostat;
    } else if (text.contains("vibration")) {
      return Icons.graphic_eq;
    } else if (text.contains("humidity")) {
      return Icons.water_drop;
    } else if (text.contains("air")) {
      return Icons.air;
    } else {
      return Icons.warning_amber_rounded;
    }
  }

  /// TIME FORMAT
  String _formatTime(DateTime time) {
    return "${time.hour}:${time.minute.toString().padLeft(2, '0')}";
  }
}