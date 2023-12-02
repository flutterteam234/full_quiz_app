import 'package:riverpod_architecture/feature/leaderboard/model/points.dart';

import '../model/user_total_content.dart';

List<UserTotalContent?> removeFirstThreeElements(
    List<UserTotalContent?> userTotalContents) {
  if (userTotalContents.length >= 3) {
    return userTotalContents.sublist(3);
  } else {
    return [];
  }
}

int getTotalPoint(List<UserTotalContent?> userTotalContent, int index) {
  if (userTotalContent[index] == null) {
    return 0;
  }

  List<Points?>? pointsData = userTotalContent[index]!.pointData;

  int totalPoints = 0;

  for (Points? x in pointsData ?? []) {
    if (x != null && x.point != null) {
      totalPoints += x.point!;
    }
  }

  return totalPoints;
}