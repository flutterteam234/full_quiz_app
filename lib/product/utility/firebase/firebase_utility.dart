import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:riverpod_architecture/product/utility/exceptions/custom_exceptions.dart';
import 'package:riverpod_architecture/product/utility/firebase/firebase_collections.dart';
import 'package:riverpod_architecture/product/utility/firebase/firebase_reference.dart';

import '../base/base_firebase_model.dart';

mixin FirebaseUtility {
  Future<List<T?>?>
      fetchList<T extends IdModel, R extends BaseFirebaseModel<T>>(
    R data,
    FirebaseCollections collections,
  ) async {
    final newsCollectionReference = collections.reference;
    final response = await newsCollectionReference.withConverter<T?>(
      fromFirestore: (snapshot, options) {
        return data.fromFirebase(snapshot);
      },
      toFirestore: (value, options) {
        return {};
      },
    ).get();

    if (response.docs.isNotEmpty) {
      final values = response.docs.map((e) => e.data()).toList();
      return values;
    }
    return null;
  }

  Future<T?> fetchDocument<T extends IdModel, R extends BaseFirebaseModel<T>>(
    String documentId,
    R data,
    FirebaseCollections collections,
  ) async {
    final documentReference = collections.reference.doc(documentId);

    try {
      final response = await documentReference.withConverter<T?>(
          fromFirestore: (snapshot, options) {
        return data.fromFirebase(snapshot);
      }, toFirestore: (value, options) {
        return {};
      }).get();

      if (response.exists) {
        final documentData = response.data();
        return documentData;
      } else {
        return null;
      }
    } catch (error) {
      throw FirebaseCustomExceptions('$error null');
    }
  }

  Future<void> addDocument<T extends IdModel, R extends BaseFirebaseModel<T>>(
    R? data,
    CollectionReference collectionReference,
  ) async {
    if (data == null) return;

    try {
      final Map<String, dynamic> dataToJson = data.toJson();
      await collectionReference.add(dataToJson);
    } catch (error) {
      throw FirebaseCustomExceptions(
          'Error adding document to ${collectionReference.path}: $error');
    }
  }

  Future<void>
      updateDocument<T extends IdModel, R extends BaseFirebaseModel<T>>(
    R? data,
    CollectionReference collectionReference,
    String? documentId,
  ) async {
    if (data == null) return;
    if(documentId == null) return;

    try {
      final Map<String, dynamic> dataToJson = data.toJson();
      await collectionReference.doc(documentId).update(dataToJson);
    } catch (error) {
      throw FirebaseCustomExceptions(
          'Error adding document to ${collectionReference.path}: $error');
    }
  }

  Future<String?> addStorage(File? sourceFile, String fileName) async {
    if (sourceFile == null) return null;

    try {
      Reference firebaseStorageRef =
          FirebaseReference.imagePath.getReference(fileName);
      UploadTask uploadTask = firebaseStorageRef.putFile(sourceFile);
      TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);
      return await taskSnapshot.ref.getDownloadURL();
    } catch (error) {
      FirebaseCustomExceptions(
          "Something wrong about add source file to FirebaseStorage");
      return null;
    }
  }
}
