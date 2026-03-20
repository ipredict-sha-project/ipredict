class HomeRepository {
  Future<Map<String, dynamic>> getHome() async {
    await Future.delayed(const Duration(milliseconds: 500));

    return {
      "temperature": 30.0,
      "vibration": 0.2,
      "airQuality": 200.0,
      "online": 12,
      "warning": 3,
      "offline": 2,
      "total": 17,
    };
  }
}
