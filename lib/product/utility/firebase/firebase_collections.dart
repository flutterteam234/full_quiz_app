import 'package:cloud_firestore/cloud_firestore.dart';

enum FirebaseCollections {
  questions,
  points,
  users,
  app,
  notes,
  subNotes,
  unitQuestions,
  loginLog,
  logoutLog
  ;

  CollectionReference get reference =>
      FirebaseFirestore.instance.collection(name);
}

