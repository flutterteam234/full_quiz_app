import 'package:riverpod_architecture/product/utility/exceptions/custom_exceptions.dart';
import 'package:riverpod_architecture/product/utility/firebase/firebase_collections.dart';

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
    } catch (error, stackTrace) {
      print("Hata: ${error}");
      print("StackTrace: $stackTrace");
      throw FirebaseCustomExceptions('$error null');
    }
  }
}
