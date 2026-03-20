import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repo/home_repo.dart';

import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository repository = HomeRepository();

  Timer? _timer;

  HomeBloc() : super(HomeInitial()) {
    on<LoadHomeEvent>(_loadHome);
    on<RefreshHomeEvent>(_refreshHome);

    _startRealTime();
  }

  void _startRealTime() {
    _timer = Timer.periodic(
      const Duration(seconds: 5),
      (_) => add(RefreshHomeEvent()),
    );
  }

  Future<void> _loadHome(
    LoadHomeEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(HomeLoading());

    await _loadData(emit);
  }

  Future<void> _refreshHome(
    RefreshHomeEvent event,
    Emitter<HomeState> emit,
  ) async {
    await _loadData(emit);
  }

  Future<void> _loadData(Emitter<HomeState> emit) async {
    try {
      final data = await repository.getHome();

      double temperature = data["temperature"];
      double vibration = data["vibration"];
      double airQuality = data["airQuality"];

      double healthScore = _calculateHealth(
        temperature,
        vibration,
        airQuality,
      );

      String healthStatus = _getHealthStatus(healthScore);

      emit(
        HomeLoaded(
          temperature: temperature,
          vibration: vibration,
          airQuality: airQuality,
          healthScore: healthScore,
          healthStatus: healthStatus,
          alerts: [],
          onlineServers: data["online"],
          warningServers: data["warning"],
          offlineServers: data["offline"],
          totalServers: data["total"],
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

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
