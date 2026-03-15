import 'package:flutter/material.dart';
import 'package:ipredict/core/theme/app_color.dart';
import 'package:ipredict/features/layout/presentation/tabs/home-tab/widget/quick_status/widget/sensor_status_item.dart';

class QuickStatusWidget extends StatelessWidget {
  final double temperature;
  final double vibration;
  final double airQuality;

  const QuickStatusWidget({
    super.key,
    required this.temperature,
    required this.vibration,
    required this.airQuality,
  });

  String getTemperatureStatus() {
    if (temperature < 35) return "Normal";
    if (temperature < 45) return "Warning";
    return "Critical";
  }

  String getVibrationStatus() {
    if (vibration < 0.1) return "Normal";
    if (vibration < 0.3) return "Warning";
    return "Critical";
  }

  String getAirQualityStatus() {
    if (airQuality < 200) return "Normal";
    if (airQuality < 300) return "Warning";
    return "Critical";
  }

  @override
  Widget build(BuildContext context) {
    final sensors = [
      {
        "title": "Temperature",
        "value": "${temperature.toInt()} °C",
        "status": getTemperatureStatus(),
        "icon": "assets/icons/Temperature.svg"
      },
      {
        "title": "Vibration",
        "value": "${vibration.toStringAsFixed(2)} g",
        "status": getVibrationStatus(),
        "icon": "assets/icons/smoke.svg"
      },
      {
        "title": "Air Quality",
        "value": "${airQuality.toInt()} IAQ",
        "status": getAirQualityStatus(),
        "icon": "assets/icons/warning.svg"
      }
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Quick Status",
            style: TextStyle(
              fontSize: 25,
              color: AppColor.black,
            ),
          ),
          SizedBox(height: 20),
          Column(
            children: sensors.map((sensor) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: SensorStatusItem(
                  title: sensor["title"]!,
                  value: sensor["value"]!,
                  status: sensor["status"]!,
                  icon: sensor["icon"]!,
                ),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
