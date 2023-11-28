import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:riverpod_architecture/feature/leaderboard/model/points.dart';

import '../../../product/models/user.dart';

@immutable
class UserTotalContent extends Equatable {
  const UserTotalContent({this.id, this.pointData, this.user});

  final String? id;
  final List<Points?>? pointData;
  final UserData? user;

  @override
  List<Object?> get props => [];

  UserTotalContent copyWith({
    String? id,
    List<Points?>? pointData,
    UserData? user,
  }) {
    return UserTotalContent(
        id: id ?? id, pointData: pointData ?? pointData, user: user);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'pointData': pointData,
      'user': user,
    };
  }

  UserTotalContent fromJson(Map<String, dynamic> json) {
    return UserTotalContent(
      id: json['id'] as String?,
      pointData: json['pointData'] as List<Points?>?,
      user: json['user'] as UserData?,
    );
  }
}
