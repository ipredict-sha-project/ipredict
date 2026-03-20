import 'dart:async';
import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/models/sensor_module.dart';
import '../../../data/repo/sensor_repo.dart';

import 'sensor_event.dart';
import 'sensor_state.dart';

class SensorsBloc extends Bloc<SensorsEvent, SensorsState> {
  final SensorRepository repository = SensorRepository();

  StreamSubscription? _subscription;

  SensorsBloc() : super(SensorsInitial()) {
    on<LoadSensorsEvent>(_load);
    on<UpdateSensorsEvent>(_update);
  }

  Future<void> _load(
    LoadSensorsEvent event,
    Emitter<SensorsState> emit,
  ) async {
    emit(SensorsLoading());

    final cached = await _loadFromCache();
    if (cached.isNotEmpty) {
      emit(SensorsLoaded(sensors: cached));
    }

    _subscription?.cancel();

    try {
      _subscription = repository.getSensorsStream().listen(
        (sensors) {
          if (sensors.isNotEmpty) {
            _saveToCache(sensors);
            add(UpdateSensorsEvent(sensors));
          }
        },
        onError: (_) {
          emit(SensorsError());
        },
      );
    } catch (_) {
      emit(SensorsError());
    }
  }

  void _update(
    UpdateSensorsEvent event,
    Emitter<SensorsState> emit,
  ) {
    emit(SensorsLoaded(sensors: event.sensors));
  }

  Future<void> _saveToCache(List<SensorModel> sensors) async {
    final prefs = await SharedPreferences.getInstance();

    final data = sensors
        .map((e) => {
              "id": e.id,
              "name": e.name,
              "type": e.type,
              "location": e.location,
              "value": e.value,
              "unit": e.unit,
              "status": e.status,
            })
        .toList();

    prefs.setString("cached_sensors", jsonEncode(data));
  }

  Future<List<SensorModel>> _loadFromCache() async {
    final prefs = await SharedPreferences.getInstance();

    final data = prefs.getString("cached_sensors");

    if (data == null) return [];

    final decoded = jsonDecode(data) as List;

    return decoded.map((e) {
      return SensorModel(
        id: e["id"],
        name: e["name"],
        type: e["type"],
        location: e["location"],
        value: (e["value"] as num).toDouble(),
        unit: e["unit"],
        status: e["status"],
        lastUpdate: DateTime.now(),
      );
    }).toList();
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
