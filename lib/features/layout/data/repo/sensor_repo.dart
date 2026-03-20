import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/sensor_module.dart';

class SensorRepository {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<List<SensorModel>> getSensorsStream() {
    return firestore.collection('sensors').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return SensorModel.fromJson(doc.data(), doc.id);
      }).toList();
    });
  }
}
