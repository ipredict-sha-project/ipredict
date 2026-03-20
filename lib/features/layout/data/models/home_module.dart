import 'alert_module.dart';

class DashboardModel {
  final double temperature;
  final double vibration;
  final double airQuality;

  final int onlineServers;
  final int warningServers;
  final int offlineServers;
  final int totalServers;

  final List<AlertModel> alerts;

  DashboardModel({
    required this.temperature,
    required this.vibration,
    required this.airQuality,
    required this.onlineServers,
    required this.warningServers,
    required this.offlineServers,
    required this.totalServers,
    required this.alerts,
  });

  factory DashboardModel.fromJson(Map<String, dynamic> json) {
    return DashboardModel(
      temperature: (json["temperature"] ?? 0).toDouble(),
      vibration: (json["vibration"] ?? 0).toDouble(),
      airQuality: (json["air_quality"] ?? 0).toDouble(),
      onlineServers: json["online_servers"] ?? 0,
      warningServers: json["warning_servers"] ?? 0,
      offlineServers: json["offline_servers"] ?? 0,
      totalServers: json["total_servers"] ?? 0,
      alerts: (json["alerts"] as List? ?? [])
          .map((e) => AlertModel.fromJson(e))
          .toList(),
    );
  }
}
