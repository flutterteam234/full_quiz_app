import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_architecture/product/utility/firebase/firebase_collections.dart';

import '../../models/userData.dart';
import '../exceptions/custom_exceptions.dart';

class FirebaseUser {
  static FirebaseUser? _instance;

  final CollectionReference _userCollection =
      FirebaseCollections.users.reference;

  UserData? _userData;

  static FirebaseUser getInstance() {
    _instance ??= FirebaseUser._internal();
    return _instance!;
  }

  FirebaseUser._internal();

  Future<void> getUserDocument() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        String userId = user.uid;

        DocumentSnapshot<Object?> snapshot =
        await _userCollection.doc(userId).get();

        if (snapshot.data() != null) {
          _userData = const UserData().fromJson(snapshot.data() as Map<String, dynamic>);
        } else {
          _userData = null;
        }

      } else {
        throw Exception("No Found User");
      }
    } catch (error) {
      throw FirebaseCustomExceptions('$error null');
    }
  }

  UserData? get userData => _userData;

  Future<void> updateData(UserData newData) async {
    try {
      if (_userData != null) {
        await _userCollection.doc(newData.id).update(newData.toJson());
        _userData = newData;
      } else {
        throw FirebaseCustomExceptions('UserData is null');
      }
    } catch (error) {
      throw FirebaseCustomExceptions('$error null');
    }
  }
}