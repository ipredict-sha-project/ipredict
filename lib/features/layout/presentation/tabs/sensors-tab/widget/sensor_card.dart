import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../core/theme/app_color.dart';
import '../../../../../layout/data/models/sensor_module.dart';
import '../screens/sensors_details.dart';

class SensorCard extends StatelessWidget {
  final SensorModel sensor;

  const SensorCard({
    super.key,
    required this.sensor,
  });

  Color getColor() {
    if (sensor.calculatedStatus == "critical") return AppColor.red;
    if (sensor.calculatedStatus == "warning") return AppColor.orange;
    return AppColor.green;
  }

  String getIcon() {
    switch (sensor.type) {
      case "temperature":
        return 'assets/icons/Temperature.svg';
      case "humidity":
        return 'assets/icons/Humidity.svg';
      case "air":
        return 'assets/icons/smoke.svg';
      case "sound":
        return 'assets/icons/sound.svg';
      case "vibration":
        return 'assets/icons/vibration_speed.svg';
      default:
        return 'assets/icons/warning.svg';
    }
  }

  @override
  Widget build(BuildContext context) {
    final color = getColor();

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => SensorsDetails(sensor: sensor),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: AppColor.white,
          border: Border.all(color: AppColor.gray_background),
          boxShadow: [
            BoxShadow(
              color: AppColor.gray.withOpacity(.2),
              blurRadius: 8,
              offset: const Offset(0, 4),
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// HEADER
              Row(
                children: [
                  Expanded(
                    child: Text(
                      sensor.name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppColor.gray_background,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: SvgPicture.asset(
                      getIcon(),
                      width: 22,
                    ),
                  )
                ],
              ),

              const SizedBox(height: 20),

              /// VALUE
              Row(
                children: [
                  Text(
                    sensor.value.toStringAsFixed(1),
                    style: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    sensor.unit,
                    style: const TextStyle(fontSize: 20),
                  ),
                ],
              ),

              const SizedBox(height: 15),

              /// STATUS
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: color.withOpacity(.1),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: color),
                ),
                child: Text(
                  sensor.calculatedStatus.toUpperCase(),
                  style: TextStyle(color: color),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}