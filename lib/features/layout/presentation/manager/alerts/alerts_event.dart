import '../../tabs/alerts-tab/module/alert_module.dart';

abstract class AlertsEvent {}

class LoadAlertsEvent extends AlertsEvent {}

class RefreshAlertsEvent extends AlertsEvent {}

class ResolveAlertEvent extends AlertsEvent {
  final AlertModel alert;

  ResolveAlertEvent(this.alert);
}

class AcknowledgeAlertEvent extends AlertsEvent {
  final AlertModel alert;

  AcknowledgeAlertEvent(this.alert);
}
