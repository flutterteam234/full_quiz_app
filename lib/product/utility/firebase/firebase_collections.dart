import 'package:cloud_firestore/cloud_firestore.dart';

enum FirebaseCollections {
  questions,
  points,
  users,
  ;

  CollectionReference get reference =>
      FirebaseFirestore.instance.collection(name);
}

