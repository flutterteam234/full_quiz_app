import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_architecture/product/utility/exceptions/custom_exceptions.dart';


abstract class IdModel {
  String? get id;
}

abstract class BaseFirebaseModel<T extends IdModel> {


  Map<String,dynamic> toJson();

  T fromJson(Map<String, dynamic> json);

  T fromFirebase(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final value = snapshot.data();
    if (value == null) {
      throw FirebaseCustomExceptions('$snapshot data is null');
    }

    value.addEntries([MapEntry("id", snapshot.id)]);
    return fromJson(value);
  }
}
