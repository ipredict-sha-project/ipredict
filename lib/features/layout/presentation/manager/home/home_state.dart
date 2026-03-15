class AlertModel {
  final String title;
  final String location;
  final String severity;
  final String time;

  AlertModel({
    required this.title,
    required this.location,
    required this.severity,
    required this.time,
  });
}

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final double temperature;
  final double vibration;
  final double airQuality;

  final double healthScore;
  final String healthStatus;

  final List<AlertModel> alerts;

  final int onlineServers;
  final int warningServers;
  final int offlineServers;
  final int totalServers;

  HomeLoaded({
    required this.temperature,
    required this.vibration,
    required this.airQuality,
    required this.healthScore,
    required this.healthStatus,
    required this.alerts,
    required this.onlineServers,
    required this.warningServers,
    required this.offlineServers,
    required this.totalServers,
  });
}

class HomeError extends HomeState {}
