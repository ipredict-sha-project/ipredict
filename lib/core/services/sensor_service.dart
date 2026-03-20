import 'dart:math';

class SensorService {
  static final SensorService _instance = SensorService._internal();

  factory SensorService() => _instance;

  SensorService._internal();

  final Random _random = Random();

  double temperature = 30;
  double humidity = 50;
  double airQuality = 180;
  double vibration = 0.1;
  double sound = 400;

  void update() {
    temperature += (_random.nextDouble() - 0.5) * 5;
    humidity += (_random.nextDouble() - 0.5) * 5;
    airQuality += (_random.nextDouble() - 0.5) * 15;
    vibration += (_random.nextDouble() - 0.5) * 0.05;
    sound += (_random.nextDouble() - 0.5) * 50;
  }
}
