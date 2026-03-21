class SensorModel {
  final String id;
  final String name;
  final String type;
  final String location;
  final double value;
  final String unit;
  final String status;
  final DateTime lastUpdate;

  SensorModel({
    required this.id,
    required this.name,
    required this.type,
    required this.location,
    required this.value,
    required this.unit,
    required this.status,
    required this.lastUpdate,
  });

  factory SensorModel.fromJson(Map<String, dynamic> json, String id) {
    return SensorModel(
      id: id,
      name: json['name'] ?? '',
      type: json['type'] ?? '',
      location: json['location'] ?? '',
      value: (json['value'] is num)
          ? (json['value'] as num).toDouble()
          : 0,
      unit: json['unit'] ?? '',
      status: json['status'] ?? 'normal',
      lastUpdate: DateTime.now(),
    );
  }

  String get calculatedStatus {
    switch (type) {
      case "temperature":
        if (value > 45) return "critical";
        if (value > 35) return "warning";
        return "normal";

      case "humidity":
        if (value > 80) return "critical";
        if (value > 60) return "warning";
        return "normal";

      case "air":
        if (value > 300) return "critical";
        if (value > 200) return "warning";
        return "normal";

      case "sound":
        if (value > 1000) return "warning";
        return "normal";

      case "vibration":
        if (value > 0.25) return "critical";
        if (value > 0.15) return "warning";
        return "normal";

      default:
        return "normal";
    }
  }
}