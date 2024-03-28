import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

import '../../utility/base/base_firebase_model.dart';

@immutable
class LogOutModel extends Equatable with IdModel, BaseFirebaseModel {
  const LogOutModel(
      {this.id, this.mail, this.device, this.status, this.ip, this.time});


  final String? mail;
  final String? device;
  final bool? status;
  final String? ip;
  final Timestamp? time;

  @override
  final String? id;

  @override
  List<Object?> get props => [id];

  LogOutModel copyWith({
    String? id,
    String? mail,
    String? device,
    bool? status,
    String? ip,
    Timestamp? time,
  }) {
    return LogOutModel(
        id: id ?? this.id,
        mail : mail ?? this.mail,
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
      'device': device,
      'status': status,
      'ip': ip,
      'time': time
    };
  }

  @override
  LogOutModel fromJson(Map<String, dynamic> json) {
    return LogOutModel(
        id: json['id'] as String?,
        mail : json['mail'] as String?,
        device: json['device'] as String?,
        status: json['status'] as bool?,
        ip: json['ip'] as String?,
        time: json['time'] as Timestamp?);
  }
}
