import 'dart:async';
import 'dart:math';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ipredict/features/layout/data/repo/home_repo.dart';

import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository repository = HomeRepository();
  Timer? _timer;

  final Random _random = Random();
  double _temperature = 30;
  double _vibration = 0.08;
  double _airQuality = 180;

  HomeBloc() : super(HomeInitial()) {
    on<LoadHomeEvent>(_loadHome);
    on<RefreshHomeEvent>(_refreshHome);

    _startRealTimeUpdates();
  }

  void _startRealTimeUpdates() {
    _timer = Timer.periodic(
      const Duration(seconds: 5),
      (timer) {
        add(RefreshHomeEvent());
      },
    );
  }

  Future<void> _loadHome(
    LoadHomeEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(HomeLoading());

    await _generateData(emit);
  }

  Future<void> _refreshHome(
    RefreshHomeEvent event,
    Emitter<HomeState> emit,
  ) async {
    await _generateData(emit);
  }

  Future<void> _generateData(
    Emitter<HomeState> emit,
  ) async {
    /// TODO: Replace this mock data with repository.getDashboardData()
    try {
      _temperature += (_random.nextDouble() - 0.5) * 4;
      _vibration += (_random.nextDouble() - 0.5) * 0.04;
      _airQuality += (_random.nextDouble() - 0.5) * 10;

      double temperature = _temperature;
      double vibration = _vibration;
      double airQuality = _airQuality;

      double healthScore = _calculateHealth(
        temperature,
        vibration,
        airQuality,
      );

      String healthStatus = _getHealthStatus(healthScore);

      List<AlertModel> alerts = _generateAlerts(
        temperature,
        vibration,
        airQuality,
      );

      emit(
        HomeLoaded(
          temperature: temperature,
          vibration: vibration,
          airQuality: airQuality,
          healthScore: healthScore,
          healthStatus: healthStatus,
          alerts: alerts,
          onlineServers: 12,
          warningServers: 3,
          offlineServers: 2,
          totalServers: 17,
        ),
      );
    } catch (e) {
      emit(HomeError());
    }
  }

  double _calculateHealth(
    double temperature,
    double vibration,
    double airQuality,
  ) {
    double score = 100;

    if (temperature > 35) score -= 20;
    if (temperature > 45) score -= 20;

    if (vibration > 0.15) score -= 20;
    if (vibration > 0.25) score -= 20;

    if (airQuality > 200) score -= 15;
    if (airQuality > 300) score -= 15;

    if (score < 0) score = 0;

    return score;
  }

  String _getHealthStatus(double score) {
    if (score >= 85) return "Good";

    if (score >= 65) return "Warning";

    return "Critical";
  }

  /// Temporary alerts generator
  /// TODO: Remove when alerts come from Firebase
  List<AlertModel> _generateAlerts(
    double temperature,
    double vibration,
    double airQuality,
  ) {
    List<AlertModel> alerts = [];

    if (temperature > 40) {
      alerts.add(
        AlertModel(
          title: "High Temperature Detected",
          location: "Server Room",
          severity: "critical",
          time: "Now",
        ),
      );
    }

    if (vibration > 0.2) {
      alerts.add(
        AlertModel(
          title: "Abnormal Vibration",
          location: "Machine #3",
          severity: "warning",
          time: "Now",
        ),
      );
    }

    if (airQuality > 250) {
      alerts.add(
        AlertModel(
          title: "Air Quality Warning",
          location: "Production Area",
          severity: "warning",
          time: "Now",
        ),
      );
    }

    return alerts;
  }

  @override
  Future<void> close() {
    _timer?.cancel();

    return super.close();
  }
}
