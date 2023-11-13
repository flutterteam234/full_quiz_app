import 'package:cloud_firestore/cloud_firestore.dart';

// tamamlanıcak isteğe baglı


abstract class IdModel {
  String? id;
}

abstract class BaseFirebaseModel<T extends IdModel> {
  T fromJson(Map<String, dynamic> json);

  T? fromFirebase(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final value = snapshot.data();
    if (value == null) {
      return null;
    }
    // fixme
    value.addEntries([MapEntry("id", snapshot.id)]);
    return fromJson(value);
  }
}
