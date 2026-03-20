import 'package:cloud_firestore/cloud_firestore.dart';

class AlertModel {
  final String id;
  final String title;
  final String description;
  final String sensorName;
  final String sensorId;
  final String location;
  final double currentValue;
  final double threshold;
  final String unit;
  String status;
  final DateTime time;
  String? resolvedBy;

  AlertModel({
    required this.id,
    required this.title,
    required this.description,
    required this.sensorName,
    required this.sensorId,
    required this.location,
    required this.currentValue,
    required this.threshold,
    required this.unit,
    required this.status,
    required this.time,
    this.resolvedBy,
  });

  factory AlertModel.fromJson(Map<String, dynamic> json, [String? docId]) {
    return AlertModel(
      id: docId ?? json['id'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      sensorName: json['sensorName'] ?? '',
      sensorId: json['sensorId'] ?? '',
      location: json['location'] ?? '',
      currentValue: (json['currentValue'] ?? 0).toDouble(),
      threshold: (json['threshold'] ?? 0).toDouble(),
      unit: json['unit'] ?? '',
      status: json['status'] ?? 'warning',
      time: (json['time'] is Timestamp)
          ? (json['time'] as Timestamp).toDate()
          : DateTime.tryParse(json['time']?.toString() ?? '') ??
          DateTime.now(),
      resolvedBy: json['resolvedBy'],
    );
  }
}
