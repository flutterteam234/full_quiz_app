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

        addAllUserTotalContents(value);
        await Future.delayed(const Duration(seconds: 1));
        setIsLoading(false);
      }
    } catch (error) {
      throw FirebaseCustomExceptions('$error null');
    }
  }

  Future<void> loadUsersContent() async {
    try {
      CollectionReference users = FirebaseCollections.users.reference;

      final response = await users.withConverter<UserData?>(
        fromFirestore: (snapshot, options) {
          return const UserData().fromFirebase(snapshot);
        },
        toFirestore: (value, options) {
          return value!.toJson();
        },
      ).get();

      if (response.docs.isNotEmpty) {
        final value = response.docs.map((e) => e.data()).toList();
      }
    } catch (error) {
      throw FirebaseCustomExceptions('$error null');
    }
  }

  void addAllUserTotalContents(List<Points?> points) {
    Map<String, List<Points>> userPointsMap = {};

    for (Points? point in points) {
      if (point != null) {
        String? userId = point.id;

        if (userId != null) {
          if (!userPointsMap.containsKey(userId)) {
            userPointsMap[userId] = [];
          }

          userPointsMap[userId]!.add(point);
        }
      }
    }

    List<UserTotalContent?> userTotalContents =
        userPointsMap.entries.map((entry) {
      String userId = entry.key;
      List<Points?>? points = entry.value;

      return UserTotalContent(id: userId, pointData: points);
    }).toList();

    state = state.copyWith(allUserTotalContents: userTotalContents);
  }

  void setIsLoading(bool value) {
    state = state.copyWith(isLoading: value);
  }
}

class LeaderboardState {
  const LeaderboardState({this.isLoading = false, this.allUserTotalContents});

  final List<UserTotalContent?>? allUserTotalContents;

  final bool isLoading;

  List<Object?>? get props => [isLoading, allUserTotalContents];

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
