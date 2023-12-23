import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_architecture/product/utility/base/base_firebase_model.dart';

@immutable
class UserData extends Equatable with IdModel, BaseFirebaseModel<UserData> {
  const UserData(
      {this.id, this.name, this.email, this.password, this.profilUrl});

  final String? name;
  final String? email;
  final String? password;
  final String? profilUrl;
  @override
  final String? id;

  @override
  List<Object?> get props => [id];

  UserData copyWith({
    String? id,
    String? name,
    String? email,
    String? password,
    String? profilUrl,
  }) {
    return UserData(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      profilUrl: profilUrl ?? this.profilUrl,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'profilUrl': profilUrl,
    };
  }

  @override
  UserData fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json['id'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      profilUrl: json['profilUrl'] as String?,
    );
  }
}
