import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/alert_module.dart';

class AlertsRepository {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<List<AlertModel>> getAlertsStream() {
    return firestore.collection('alerts').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return AlertModel.fromJson(doc.data(), doc.id);
      }).toList();
    });
  }

  Future<void> resolveAlert(String id) async {
    await firestore.collection('alerts').doc(id).update({
      "status": "resolved",
      "resolvedBy": "Operator",
    });
  }

  Future<void> acknowledgeAlert(String id) async {
    await firestore.collection('alerts').doc(id).update({
      "acknowledged": true,
    });
  }
}
