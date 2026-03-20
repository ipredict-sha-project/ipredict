abstract class HomeState {}

/// INITIAL
class HomeInitial extends HomeState {}

/// LOADING
class HomeLoading extends HomeState {}

/// LOADED
class HomeLoaded extends HomeState {
  final double temperature;
  final double vibration;
  final double airQuality;

  final double healthScore;
  final String healthStatus;

  /// 👇 مهم: مش AlertModel
  final List alerts;

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

/// ERROR
class HomeError extends HomeState {}
