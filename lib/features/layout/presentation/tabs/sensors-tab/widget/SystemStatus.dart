import 'package:flutter/material.dart';
import '../../../../../../core/theme/app_color.dart';
import '../../../../data/models/sensor_module.dart';

class Systemstatus extends StatelessWidget {
  final List<SensorModel> sensors;

  const Systemstatus({
    super.key,
    required this.sensors,
  });

  int get active => sensors.where((s) => s.calculatedStatus == "normal").length;

  int get warning =>
      sensors.where((s) => s.calculatedStatus == "warning").length;

  int get critical =>
      sensors.where((s) => s.calculatedStatus == "critical").length;

  int get offline =>
      sensors.where((s) => s.calculatedStatus == "offline").length;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColor.gray.withOpacity(0.5),
            blurRadius: 8,
            offset: const Offset(0, 4),
          )
        ],
        color: AppColor.white,
        border: Border.all(color: AppColor.gray_background),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 15),
            child: Row(
              children: [
                Text(
                  'SYSTEM STATUS',
                  style: TextStyle(color: AppColor.gray),
                ),
                const Spacer(),
                Text(
                  '${sensors.length} Sensors',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    _box(active, "Active", AppColor.green),
                    const SizedBox(width: 10),
                    _box(warning, "Warning", AppColor.orange),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    _box(critical, "Critical", AppColor.red),
                    const SizedBox(width: 10),
                    _box(offline, "Offline", AppColor.gray),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _box(int value, String title, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 18),
        decoration: BoxDecoration(
          color: color.withOpacity(.1),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: color),
        ),
        child: Column(
          children: [
            Text(
              value.toString(),
              style: TextStyle(
                color: color,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              title.toUpperCase(),
              style: TextStyle(color: color),
            ),
          ],
        ),
      ),
    );
  }
}
