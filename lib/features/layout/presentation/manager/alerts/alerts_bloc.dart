import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/alert_module.dart';
import '../../../data/repo/alerts_repo.dart';
import 'alerts_event.dart';
import 'alerts_state.dart';

class AlertsBloc extends Bloc<AlertsEvent, AlertsState> {
  final AlertsRepository repository = AlertsRepository();

  StreamSubscription? _subscription;

  AlertsBloc() : super(AlertsInitial()) {
    on<LoadAlertsEvent>(_load);

    on<UpdateAlertsEvent>((event, emit) {
      _emitAlerts(event.alerts, emit);
    });

    on<ResolveAlertEvent>(_resolveAlert);
    on<AcknowledgeAlertEvent>(_acknowledgeAlert);
  }

  Future<void> _load(
    LoadAlertsEvent event,
    Emitter<AlertsState> emit,
  ) async {
    emit(AlertsLoading());

    _subscription?.cancel();

    _subscription = repository.getAlertsStream().listen((alerts) {
      add(UpdateAlertsEvent(alerts));
    });
  }

  void _emitAlerts(
    List<AlertModel> alerts,
    Emitter<AlertsState> emit,
  ) {
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
    await repository.resolveAlert(event.alert.id);
  }

  Future<void> _acknowledgeAlert(
      AcknowledgeAlertEvent event,
      Emitter<AlertsState> emit,
      ) async {
    await repository.acknowledgeAlert(event.alert.id);
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
