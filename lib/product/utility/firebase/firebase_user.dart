import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_architecture/product/utility/firebase/firebase_collections.dart';
import 'package:riverpod_architecture/product/utility/firebase/firebase_utility.dart';
import '../../models/userData.dart';

class FirebaseUser with FirebaseUtility {

  static final FirebaseUser _instance = FirebaseUser._();

  FirebaseUser._();

  static FirebaseUser get instance => _instance;

  UserData? userData;

  Future<void> getUserDataById() async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      try {
        final documentId = user.uid;
        final result = await fetchDocument<UserData, UserData>(
          documentId,
          const UserData(),
          FirebaseCollections.users,
        );

        userData = result;

      } catch (e) {
        throw Exception("Veri çekme hatası: $e");
      }
    } else {
      print("Kullanıcı oturumu açık değil");
    }

  }
}
