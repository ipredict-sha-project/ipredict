import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ServerStatusItem extends StatelessWidget {

  final String title;
  final int value;
  final Color color;
  final String icon;

  const ServerStatusItem({
    super.key,
    required this.title,
    required this.value,
    required this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: color),
          ),
          child: SvgPicture.asset(
            icon,
            width: 25,
            color: color,
          ),
        ),

        SizedBox(height: 5),

        Text(
          "$value",
          style: TextStyle(
            color: color,
            fontSize: 22,
          ),
        ),

        Text(
          title,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 18,
          ),
        )
      ],
    );
  }
}