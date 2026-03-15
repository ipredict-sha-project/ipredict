import 'dart:async';
import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../tabs/alerts-tab/module/alert_module.dart';

import 'alerts_event.dart';
import 'alerts_state.dart';

class AlertsBloc extends Bloc<AlertsEvent, AlertsState> {
  Timer? _timer;

  final Random _random = Random();

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
      (_) {
        /// يظهر Alert جديد أحيانًا فقط
        if (_random.nextDouble() < 0.4) {
          add(RefreshAlertsEvent());
        }
      },
    );
  }

  Future<void> _loadAlerts(
    LoadAlertsEvent event,
    Emitter<AlertsState> emit,
  ) async {
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

  AlertModel _createAlert() {
    int type = _random.nextInt(3);

    String status;

    if (type == 0) {
      status = "critical";
    } else if (type == 1) {
      status = "warning";
    } else {
      status = "resolved";
    }

    return AlertModel(
      title: "Temperature Alert",
      description: "Server temperature exceeded safe limit",
      sensorName: "Temperature Sensor",
      sensorId: "TEMP-${_random.nextInt(100)}",
      location: "Server Room A",
      currentValue: 70 + _random.nextInt(20).toDouble(),
      threshold: 70,
      unit: "°C",
      status: status,
      time: DateTime.now(),
      resolvedBy: status == "resolved" ? "Operator" : null,
    );
  }

  @override
  Future<void> close() {
    _timer?.cancel();

    return super.close();
  }
}
