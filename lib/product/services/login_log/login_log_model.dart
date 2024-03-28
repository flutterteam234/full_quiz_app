import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

import '../../utility/base/base_firebase_model.dart';

@immutable
class LoginLogModel extends Equatable with IdModel, BaseFirebaseModel {
  const LoginLogModel(
      {this.id, this.mail,this.method, this.device, this.status, this.ip, this.time});


  final String? mail;
  final String? method;
  final String? device;
  final bool? status;
  final String? ip;
  final Timestamp? time;

  @override
  final String? id;

  @override
  List<Object?> get props => [id];

  LoginLogModel copyWith({
    String? id,
    String? mail,
    String? method,
    String? device,
    bool? status,
    String? ip,
    Timestamp? time,
  }) {
    return LoginLogModel(
        id: id ?? this.id,
        mail : mail ?? this.mail,
        method: method ?? this.method,
        device: device ?? this.device,
        status: status ?? this.status,
        ip: ip ?? this.ip,
        time: time ?? this.time);
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'mail': mail,
      'method': method,
      'device': device,
      'status': status,
      'ip': ip,
      'time': time
    };
  }

  @override
  LoginLogModel fromJson(Map<String, dynamic> json) {
    return LoginLogModel(
        id: json['id'] as String?,
        mail : json['mail'] as String?,
        method: json['method'] as String?,
        device: json['device'] as String?,
        status: json['status'] as bool?,
        ip: json['ip'] as String?,
        time: json['time'] as Timestamp?);
  }
}
