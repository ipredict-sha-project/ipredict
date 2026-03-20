import 'package:flutter/material.dart';
import 'package:ipredict/features/layout/presentation/tabs/home-tab/widget/server_status/widget/server_status_item.dart';
import '../../../../../../../core/theme/app_color.dart';

class ServerStatusWidget extends StatefulWidget {
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
  State<ServerStatusWidget> createState() => _ServerStatusWidgetState();
}

class _ServerStatusWidgetState extends State<ServerStatusWidget>
    with TickerProviderStateMixin {

  late AnimationController _fillController;
  late AnimationController _pulseController;

  late Animation<double> _fillAnimation;
  late Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();

    /// FILL ANIMATION
    _fillController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _fillAnimation = CurvedAnimation(
      parent: _fillController,
      curve: Curves.easeOut,
    );

    /// PULSE ANIMATION (critical)
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _pulseAnimation = Tween(begin: 0.8, end: 1.2).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );

    _startAnimations();
  }

  void _startAnimations() {
    _fillController.forward(from: 0);

    if (widget.offline > 0) {
      _pulseController.repeat(reverse: true);
    } else {
      _pulseController.stop();
    }
  }

  @override
  void didUpdateWidget(covariant ServerStatusWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.online != widget.online ||
        oldWidget.warning != widget.warning ||
        oldWidget.offline != widget.offline) {
      _startAnimations();
    }
  }

  @override
  void dispose() {
    _fillController.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final online = widget.online;
    final warning = widget.warning;
    final offline = widget.offline;
    final total = widget.total;

    /// STATUS LOGIC
    Color statusColor;
    String statusText;

    if (offline > 0) {
      statusColor = AppColor.red;
      statusText = "Critical";
    } else if (warning > 0) {
      statusColor = AppColor.orange;
      statusText = "Warning";
    } else {
      statusColor = AppColor.green;
      statusText = "Stable";
    }

    final uptime =
    total == 0 ? 0 : (online / total) * 100;

    final onlineRatio =
    total == 0 ? 0 : online / total;
    final warningRatio =
    total == 0 ? 0 : warning / total;
    final offlineRatio =
    total == 0 ? 0 : offline / total;

    final servers = [
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
          const Text(
            "Server Status",
            style: TextStyle(
              color: AppColor.black,
              fontSize: 25,
            ),
          ),

          const SizedBox(height: 20),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: AppColor.gray.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                )
              ],
              color: AppColor.white,
              border: Border.all(color: AppColor.gray_background),
            ),
            child: Column(
              children: [

                /// TOP
                Row(
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

                const SizedBox(height: 20),
                Divider(color: AppColor.gray.withOpacity(.3)),
                const SizedBox(height: 15),

                /// HEADER
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "System Uptime",
                      style: TextStyle(
                        color: AppColor.gray,
                        fontSize: 16,
                      ),
                    ),

                    /// STATUS BADGE (DYNAMIC + PULSE)
                    ScaleTransition(
                      scale: offline > 0 ? _pulseAnimation : const AlwaysStoppedAnimation(1),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 6),
                        decoration: BoxDecoration(
                          color: statusColor.withOpacity(.1),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: statusColor),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.circle,
                                size: 10, color: statusColor),
                            const SizedBox(width: 6),
                            Text(
                              statusText,
                              style: TextStyle(color: statusColor),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),

                const SizedBox(height: 10),

                Text(
                  "${uptime.toStringAsFixed(1)}%",
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 15),

                /// ANIMATED BAR
                AnimatedBuilder(
                  animation: _fillAnimation,
                  builder: (context, child) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Row(
                        children: [
                          Expanded(
                            flex: ((onlineRatio * 100) * _fillAnimation.value).toInt(),
                            child: Container(height: 8, color: AppColor.green),
                          ),
                          Expanded(
                            flex: ((warningRatio * 100) * _fillAnimation.value).toInt(),
                            child: Container(height: 8, color: AppColor.orange),
                          ),
                          Expanded(
                            flex: ((offlineRatio * 100) * _fillAnimation.value).toInt(),
                            child: Container(height: 8, color: AppColor.red),
                          ),
                        ],
                      ),
                    );
                  },
                ),

                const SizedBox(height: 10),

                /// FOOTER
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("$online servers online",
                        style: const TextStyle(color: AppColor.gray, fontSize: 12)),
                    Text("$warning need attention",
                        style: const TextStyle(color: AppColor.gray, fontSize: 12)),
                    Text("$offline offline",
                        style: const TextStyle(color: AppColor.gray, fontSize: 12)),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}