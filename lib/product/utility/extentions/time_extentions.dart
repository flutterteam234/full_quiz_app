import 'package:cloud_firestore/cloud_firestore.dart';

extension DateTimeExtensions on DateTime {
  Timestamp toTimestamp() {
    return Timestamp.fromDate(this);
  }

  static Timestamp currentTimestamp() {
    return DateTime.now().toTimestamp();
  }
}