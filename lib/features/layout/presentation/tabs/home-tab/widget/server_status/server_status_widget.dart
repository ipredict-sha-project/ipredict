import 'package:flutter/material.dart';
import 'package:ipredict/features/layout/presentation/tabs/home-tab/widget/server_status/widget/server_status_item.dart';
import '../../../../../../../core/theme/app_color.dart';

class ServerStatusWidget extends StatelessWidget {
  final int online;
  final int warning;
  final int offline;
  final int total;

  const ServerStatusWidget({
    super.key,
    required this.online,
    required this.warning,
    required this.offline,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> servers = [
      {
        "title": "Online",
        "value": online,
        "color": AppColor.green,
        "icon": "assets/icons/active.svg"
      },
      {
        "title": "Warning",
        "value": warning,
        "color": AppColor.orange,
        "icon": "assets/icons/warning.svg"
      },
      {
        "title": "Offline",
        "value": offline,
        "color": AppColor.red,
        "icon": "assets/icons/server.svg"
      },
      {
        "title": "Total",
        "value": total,
        "color": AppColor.blue,
        "icon": "assets/icons/server.svg"
      }
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Server Status",
            style: TextStyle(
              color: AppColor.black,
              fontSize: 25,
            ),
          ),
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: servers.map((server) {
                return ServerStatusItem(
                  title: server["title"] as String,
                  value: server["value"] as int,
                  color: server["color"] as Color,
                  icon: server["icon"] as String,
                );
              }).toList(),
            ),
          )
        ],
      ),
    );
  }
}
