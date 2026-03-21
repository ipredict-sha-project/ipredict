import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/sensor_module.dart';

class SensorRepository {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;

  Stream<List<SensorModel>> getSensorsStream() {
    final userId = auth.currentUser?.uid;

    if (userId == null) {
      print("❌ No user logged in");
      return const Stream.empty();
    }

    print("✅ User ID: $userId");

    return firestore
        .collection('users')
        .doc(userId)
        .collection('sensors')
        .snapshots()
        .map((snapshot) {
      print("📡 Sensors count: ${snapshot.docs.length}");

      return snapshot.docs.map((doc) {
        return SensorModel.fromJson(doc.data(), doc.id);
      }).toList();
    });
  }
}