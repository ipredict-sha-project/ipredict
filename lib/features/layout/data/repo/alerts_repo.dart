import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/alert_module.dart';

class AlertsRepository {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;

  Stream<List<AlertModel>> getAlertsStream() {
    final userId = auth.currentUser?.uid;

    if (userId == null) {
      print("❌ No user logged in");
      return const Stream.empty();
    }

    return firestore
        .collection('users')
        .doc(userId)
        .collection('alerts')
        .snapshots()
        .map((snapshot) {
      print("🚨 Alerts count: ${snapshot.docs.length}");

      return snapshot.docs.map((doc) {
        final data = doc.data();

        return AlertModel.fromJson(data, doc.id);
      }).toList();
    });
  }

  Future<void> resolveAlert(String id) async {
    final userId = auth.currentUser!.uid;

    await firestore
        .collection('users')
        .doc(userId)
        .collection('alerts')
        .doc(id)
        .update({
      "status": "resolved",
      "resolvedBy": "Operator",
    });
  }

  Future<void> acknowledgeAlert(String id) async {
    final userId = auth.currentUser!.uid;

    await firestore
        .collection('users')
        .doc(userId)
        .collection('alerts')
        .doc(id)
        .update({
      "status": "warning",
    });
  }
}