import 'package:cloud_firestore/cloud_firestore.dart';

enum FirebaseCollections {
  questions,
  points,
  ;

  CollectionReference get reference =>
      FirebaseFirestore.instance.collection(name);
}