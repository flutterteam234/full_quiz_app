import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:riverpod_architecture/product/models/user.dart';
import 'package:riverpod_architecture/product/utility/base/base_firebase_model.dart';

import '../../../product/utility/exceptions/custom_exceptions.dart';

@immutable
class Points extends Equatable with IdModel, BaseFirebaseModel<Points> {
  const Points(
      {this.id,
      this.point,
      this.date,
   });

  final int? point;
  final Timestamp? date;

  @override
  final String? id;

  @override
  List<Object?> get props => [id];

  Points copyWith({
    String? id,
    int? point,
    Timestamp? date,
    String? userName,
    String? userEmail,
    String? userPassword,
  }) {
    return Points(
      id: id ?? this.id,
      point: point ?? this.point,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'point': point,
      'date': date,

    };
  }

  @override
  Points fromJson(Map<String, dynamic> json) {
    return Points(
      id: json['id'] as String?,
      point: json['point'] as int?,
      date: json['date'] as Timestamp?,

    );
  }


}
