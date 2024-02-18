import 'package:cloud_firestore/cloud_firestore.dart';

enum FirebaseCollections {
  questions,
  points,
  users,
  app,
  notes,
  subNotes,
  unitQuestions
  ;

  CollectionReference get reference =>
      FirebaseFirestore.instance.collection(name);
}

