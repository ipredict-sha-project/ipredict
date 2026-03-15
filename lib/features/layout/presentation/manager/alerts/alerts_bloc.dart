import 'dart:async';
import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repo/alerts_repo.dart';
import '../../tabs/alerts-tab/module/alert_module.dart';

import 'alerts_event.dart';
import 'alerts_state.dart';

class AlertsBloc extends Bloc<AlertsEvent, AlertsState> {
  final AlertsRepository repository = AlertsRepository();
  Timer? _timer;

  final Random _random = Random();
  double _temperature = 32;
  double _vibration = 0.07;
  double _airQuality = 180;

  AlertsBloc() : super(AlertsInitial()) {
    on<LoadAlertsEvent>(_loadAlerts);

    on<RefreshAlertsEvent>(_refreshAlerts);

    on<ResolveAlertEvent>(_resolveAlert);

    on<AcknowledgeAlertEvent>(_acknowledgeAlert);

    _startRealTime();
  }

  void _startRealTime() {
    _timer = Timer.periodic(
      const Duration(seconds: 5),
      (timer) {
        _temperature += (_random.nextDouble() - 0.5) * 3;
        _vibration += (_random.nextDouble() - 0.5) * 0.03;
        _airQuality += (_random.nextDouble() - 0.5) * 10;

        if (_temperature > 45 || _vibration > 0.25 || _airQuality > 280) {
          add(RefreshAlertsEvent());
        }
      },
    );
  }

  Future<void> _loadAlerts(
    LoadAlertsEvent event,
    Emitter<AlertsState> emit,
  ) async {
    /// TODO: Replace with repository.getAlerts()
    emit(AlertsLoading());

    List<AlertModel> alerts = [];

    for (int i = 0; i < 5; i++) {
      alerts.add(_createAlert());
    }

    _emitAlerts(alerts, emit);
  }

  Future<void> _refreshAlerts(
    RefreshAlertsEvent event,
    Emitter<AlertsState> emit,
  ) async {
    if (state is AlertsLoaded) {
      final current = state as AlertsLoaded;

      List<AlertModel> alerts = List.from(current.alerts);

      alerts.insert(0, _createAlert());

      _emitAlerts(alerts, emit);
    }
  }

  void _emitAlerts(
    List<AlertModel> alerts,
    Emitter<AlertsState> emit,
  ) {
    /// ترتيب Critical فوق
    alerts.sort((a, b) {
      if (a.status == "critical" && b.status != "critical") return -1;

      if (b.status == "critical" && a.status != "critical") return 1;

      return b.time.compareTo(a.time);
    });

    int critical = alerts.where((a) => a.status == "critical").length;

    int warning = alerts.where((a) => a.status == "warning").length;

    int resolved = alerts.where((a) => a.status == "resolved").length;

    emit(
      AlertsLoaded(
        alerts: alerts,
        total: alerts.length,
        critical: critical,
        warning: warning,
        resolved: resolved,
      ),
    );
  }

  Future<void> _resolveAlert(
    ResolveAlertEvent event,
    Emitter<AlertsState> emit,
  ) async {
    if (state is AlertsLoaded) {
      final current = state as AlertsLoaded;

      event.alert.status = "resolved";

      event.alert.resolvedBy = "Operator";

      _emitAlerts(current.alerts, emit);
    }
  }

  Future<void> _acknowledgeAlert(
    AcknowledgeAlertEvent event,
    Emitter<AlertsState> emit,
  ) async {
    if (state is AlertsLoaded) {
      final current = state as AlertsLoaded;

      event.alert.resolvedBy = "Operator";

      _emitAlerts(current.alerts, emit);
    }
  }

  /// Temporary mock alert
  /// TODO: Remove when Firebase connected
  AlertModel _createAlert() {
    String status = "warning";

    String title = "Sensor Alert";

    double value = 0;

    double threshold = 0;

    String unit = "";

    String sensorName = "";

    if (_temperature > 45) {
      status = "critical";

      title = "High Temperature";

      value = _temperature;

      threshold = 45;

      unit = "°C";

      sensorName = "Temperature Sensor";
    } else if (_vibration > 0.25) {
      status = "warning";

      title = "Abnormal Vibration";

      value = _vibration;

      threshold = 0.25;

      unit = "g";

      sensorName = "Vibration Sensor";
    } else {
      status = "warning";

      title = "Air Quality Warning";

      value = _airQuality;

      threshold = 280;

      unit = "IAQ";

      sensorName = "Air Quality Sensor";
    }

    return AlertModel(
      id: "AL-${_random.nextInt(99999)}",
      title: title,
      description: "Sensor exceeded safe threshold",
      sensorName: sensorName,
      sensorId: "S-${_random.nextInt(100)}",
      location: "Data Center A",
      currentValue: value,
      threshold: threshold,
      unit: unit,
      status: status,
      time: DateTime.now(),
      resolvedBy: null,
    );
  }

  @override
  Future<void> close() {
    _timer?.cancel();

    return super.close();
  }
}
