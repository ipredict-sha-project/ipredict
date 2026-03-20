import '../../../data/models/alert_module.dart';

abstract class AlertsEvent {}

class LoadAlertsEvent extends AlertsEvent {}

class UpdateAlertsEvent extends AlertsEvent {
  final List<AlertModel> alerts;

  UpdateAlertsEvent(this.alerts);
}

class ResolveAlertEvent extends AlertsEvent {
  final AlertModel alert;

  ResolveAlertEvent(this.alert);
}

class AcknowledgeAlertEvent extends AlertsEvent {
  final AlertModel alert;

  AcknowledgeAlertEvent(this.alert);
}
