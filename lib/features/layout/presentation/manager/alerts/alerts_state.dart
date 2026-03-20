import '../../../data/models/alert_module.dart';

abstract class AlertsState {}

class AlertsInitial extends AlertsState {}

class AlertsLoading extends AlertsState {}

class AlertsLoaded extends AlertsState {
  final List<AlertModel> alerts;

  final int total;
  final int critical;
  final int warning;
  final int resolved;

  AlertsLoaded({
    required this.alerts,
    required this.total,
    required this.critical,
    required this.warning,
    required this.resolved,
  });
}
