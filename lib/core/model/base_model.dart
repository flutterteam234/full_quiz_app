
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class BaseModel<T> {
  Map<String,dynamic> toJson();

  T fromJson(Map<String,dynamic> json);

  T fromFirebase(DocumentSnapshot<Map<String, dynamic>> snapshot);


  String? get id;

}
