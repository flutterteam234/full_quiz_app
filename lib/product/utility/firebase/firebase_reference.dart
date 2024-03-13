import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';

enum FirebaseReference {
  imagePath("images");

  final String value;

  const FirebaseReference(this.value);
}

extension FirebaseReferenceExtention on FirebaseReference {
  Reference getReference(String fileName) {
    return FirebaseStorage.instance.ref().child('$this/$fileName');
  }
}
