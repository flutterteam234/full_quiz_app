import '../model/user_total_content.dart';

List<UserTotalContent?> removeFirstThreeElements(
    List<UserTotalContent?> userTotalContents) {
  if (userTotalContents.length >= 3) {
    return userTotalContents.sublist(3);
  } else {
    return [];
  }
}
