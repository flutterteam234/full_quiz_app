import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:riverpod_architecture/product/utility/base/base_firebase_model.dart';

@immutable
class AppInfo extends Equatable with IdModel, BaseFirebaseModel<AppInfo> {
  const AppInfo({
    this.id,
    this.version,
    this.platform,
    this.status,
  });

  final String? version;
  final String? platform;
  final bool? status;

  @override
  final String? id;

  @override
  List<Object?> get props => [id];

  AppInfo copyWith({
    String? id,
    String? version,
    String? platform,
    bool? status,
  }) {
    return AppInfo(
      id: id ?? this.id,
      version: version ?? this.version,
      platform: platform ?? this.platform,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'version': version,
      'platform': platform,
      'status': status,
    };
  }

  @override
  AppInfo fromJson(Map<String, dynamic> json) {
    return AppInfo(
      id: json['id'] as String?,
      version: json['version'] as String?,
      platform: json['platform'] as String?,
      status: json['status'] as bool?,
    );
  }
}
