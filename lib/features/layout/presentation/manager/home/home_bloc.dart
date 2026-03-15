import 'dart:async';
import 'dart:math';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  Timer? _timer;

  final Random _random = Random();

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
    try {
      double temperature = 22 + _random.nextDouble() * 25;
      double vibration = 0.03 + _random.nextDouble() * 0.3;
      double airQuality = 120 + _random.nextDouble() * 200;

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
