import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:riverpod_architecture/feature/leaderboard/model/points.dart';
import 'package:riverpod_architecture/product/utility/base/base_firebase_model.dart';
import '../../../product/models/userData.dart';

@immutable
class UserTotalContent extends Equatable
    with IdModel, BaseFirebaseModel<UserTotalContent> {
  const UserTotalContent(
      {this.id,
      this.pointData,
      this.userName,
      this.userEmail,
      this.userPassword,
      this.photoURL});

  final List<Points?>? pointData;
  final String? userName;
  final String? userEmail;
  final String? userPassword;
  final String? photoURL;
  @override
  final String? id;

  @override
  List<Object?> get props => [id];

  UserTotalContent copyWith({
    String? id,
    List<Points?>? pointData,
    UserData? user,
    String? userName,
    String? userEmail,
    String? userPassword,
    String? photoURL,
  }) {
    return UserTotalContent(
        id: id ?? id,
        pointData: pointData ?? pointData,
        userEmail: userEmail,
        userName: userName,
        photoURL: photoURL,
        userPassword: userPassword);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'pointData': pointData,
      'userName': userName,
      'userEmail': userEmail,
      'userPassword': userPassword,
      'photoURL': photoURL,
    };
  }

  @override
  UserTotalContent fromJson(Map<String, dynamic> json) {
    return UserTotalContent(
      id: json['id'] as String?,
      pointData: json['pointData'] as List<Points?>?,
      userName: json['userName'] as String?,
      userEmail: json['userEmail'] as String?,
      userPassword: json['userPassword'] as String?,
      photoURL: json['photoURL'] as String?,
    );
  }
}
