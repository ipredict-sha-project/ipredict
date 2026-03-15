import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../../core/theme/app_color.dart';

class AlertStatBox extends StatelessWidget {
  final String icon;
  final int number;
  final String label;
  final Color color;

  const AlertStatBox({
    super.key,
    required this.icon,
    required this.number,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      padding: const EdgeInsets.symmetric(
        vertical: 14,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: color.withOpacity(.08),
        border: Border.all(color: color.withOpacity(.4)),
      ),
      child: Column(
        children: [
          SvgPicture.asset(
            icon,
            width: 20,
            color: color,
          ),
          const SizedBox(height: 6),
          Text(
            number.toString(),
            style: TextStyle(
              color: color,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: AppColor.black,
            ),
          ),
        ],
      ),
    );
  }
}
