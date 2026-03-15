import 'package:cloud_firestore/cloud_firestore.dart';

class AlertModel {
  final String id;
  final String title;
  final String description;
  String status;

  final String sensorName;
  final String sensorId;

  final String location;

  final double currentValue;
  final double threshold;

  final String unit;

  final DateTime time;

  String? resolvedBy;

  AlertModel({
    required this.id,
    required this.title,
    required this.description,
    required this.status,
    required this.sensorName,
    required this.sensorId,
    required this.location,
    required this.currentValue,
    required this.threshold,
    required this.unit,
    required this.time,
    this.resolvedBy,
  });

  factory AlertModel.fromJson(Map<String, dynamic> json) {
    return AlertModel(
      id: json["id"] ?? "",
      title: json["title"] ?? "",
      description: json["description"] ?? "",
      status: json["status"] ?? "",
      sensorName: json["sensor_name"] ?? "",
      sensorId: json["sensor_id"] ?? "",
      location: json["location"] ?? "",
      currentValue: (json["current_value"] ?? 0).toDouble(),
      threshold: (json["threshold"] ?? 0).toDouble(),
      unit: json["unit"] ?? "",
      time: (json["time"] as Timestamp).toDate(),
      resolvedBy: json["resolved_by"],
    );
  }
}
