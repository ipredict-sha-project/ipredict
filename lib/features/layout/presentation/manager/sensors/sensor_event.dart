import '../../../data/models/sensor_module.dart';

abstract class SensorsEvent {}

class LoadSensorsEvent extends SensorsEvent {}

class UpdateSensorsEvent extends SensorsEvent {
  final List<SensorModel> sensors;

  UpdateSensorsEvent(this.sensors);
}
