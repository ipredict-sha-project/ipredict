import '../../../data/models/sensor_module.dart';

abstract class SensorsState {}

class SensorsInitial extends SensorsState {}

class SensorsLoading extends SensorsState {}

class SensorsLoaded extends SensorsState {
  final List<SensorModel> sensors;

  SensorsLoaded({required this.sensors});
}

class SensorsError extends SensorsState {}
