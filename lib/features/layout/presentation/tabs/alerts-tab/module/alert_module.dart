class AlertModel {
  final String title;
  final String description;

  final String sensorName;
  final String sensorId;

  final String location;

  final double currentValue;
  final double threshold;
  final String unit;

  final DateTime time;

  String status;

  String? resolvedBy;

  AlertModel({
    required this.title,
    required this.description,
    required this.sensorName,
    required this.sensorId,
    required this.location,
    required this.currentValue,
    required this.threshold,
    required this.unit,
    required this.time,
    required this.status,
    this.resolvedBy,
  });
}
