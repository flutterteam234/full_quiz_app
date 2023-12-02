import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_architecture/feature/leaderboard/model/points.dart';
import 'package:riverpod_architecture/feature/leaderboard/model/user_total_content.dart';
import 'package:riverpod_architecture/product/utility/exceptions/custom_exceptions.dart';
import 'package:riverpod_architecture/product/utility/firebase/firebase_collections.dart';
import 'package:riverpod_architecture/product/utility/firebase/firebase_utility.dart';

import '../../product/models/user.dart';

class LeaderboardNotifier extends StateNotifier<LeaderboardState>
    with FirebaseUtility {
  LeaderboardNotifier() : super(const LeaderboardState());

  Future<void> loadPointsAndUsers() async {
    try {
      CollectionReference pointsCollection = FirebaseCollections.points.reference;

      final response = await pointsCollection.withConverter<Points?>(
        fromFirestore: (snapshot, options) {
          return const Points().fromFirebase(snapshot);
        },
        toFirestore: (value, options) {
          return value!.toJson();
        },
      ).get();

      if (response.docs.isNotEmpty) {
        final pointsList = response.docs.map((e) => e.data()).toList();

        final List<Future<UserData?>> userFutures = [];

        for (final points in pointsList) {
          final userId = points?.id.toString() ?? '';
          userFutures.add(loadUser(userId));
        }

        final List<UserData?> usersList = await Future.wait(userFutures);

        final List<UserTotalContent?> userTotalList = [];

        for (int i = 0; i < pointsList.length; i++) {
          final userTotalContent = UserTotalContent(
            id: usersList[i]?.id ?? '',
            pointData: [pointsList[i]],
            userName: usersList[i]?.name ?? '',
            userEmail: usersList[i]?.email ?? '',
            userPassword: usersList[i]?.password ?? '',
          );
          userTotalList.add(userTotalContent);
        }

        print("UserTotalList: ${userTotalList[0]?.userName}");

        state = state.copyWith(
          allUserTotalContents: userTotalList,
        );

        await Future.delayed(const Duration(seconds: 1));
        setIsLoading(false);
      }
    } catch (error, stackTrace) {
      print("Error in loadPointsAndUsers: $error");
      print("StackTrace: $stackTrace");
      throw FirebaseCustomExceptions('$error null');
    }
  }

  Future<void> loadPoints() async {
    try {
      CollectionReference points = FirebaseCollections.points.reference;

      final response = await points.withConverter<Points?>(
        fromFirestore: (snapshot, options) {
          return const Points().fromFirebase(snapshot);
        },
        toFirestore: (value, options) {
          return value!.toJson();
        },
      ).get();

      if (response.docs.isNotEmpty) {
        final value = response.docs.map((e) => e.data()).toList();

        loadUser(value[0]?.id.toString() ?? '');

        await Future.delayed(const Duration(seconds: 1));
        setIsLoading(false);
      }
    } catch (error) {
      throw FirebaseCustomExceptions('$error null');
    }
  }

  Future<UserData?> loadUser(String userId) async {
    try {
      DocumentReference userDocRef =
      FirebaseFirestore.instance.collection('users').doc(userId);

      final response = await userDocRef.withConverter<UserData?>(
        fromFirestore: (snapshot, options) {
          return const UserData().fromFirebase(snapshot);
        },
        toFirestore: (value, options) {
          return value!.toJson();
        },
      ).get();

      if (response.exists) {
        final userData = response.data();
        return userData;
      } else {
        return null;
      }
    } catch (error) {
      throw FirebaseCustomExceptions('$error null');
    }
  }

  void setIsLoading(bool value) {
    state = state.copyWith(
      isLoading: value,
    );
  }
}

class LeaderboardState {
  const LeaderboardState({
    this.isLoading = true,
    this.allUserTotalContents,
  });

  final List<UserTotalContent?>? allUserTotalContents;
  final bool isLoading;

  LeaderboardState copyWith({
    bool? isLoading,
    List<UserTotalContent?>? allUserTotalContents,
  }) {
    return LeaderboardState(
      isLoading: isLoading ?? this.isLoading,
      allUserTotalContents: allUserTotalContents ?? this.allUserTotalContents,
    );
  }
}
