import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:riverpod_architecture/product/models/subNotesModel.dart';
import 'package:riverpod_architecture/product/utility/base/base_firebase_model.dart';

// quiz tamamlancak

@immutable
class UnitQuestionsModel extends Equatable
    with IdModel, BaseFirebaseModel<UnitQuestionsModel> {
  const UnitQuestionsModel(
      {this.id, this.title, this.documentIds, this.unit, this.imagePath});

  final String? title;
  final List<dynamic>? documentIds;
  final int? unit;
  final String? imagePath;

  @override
  final String? id;

  @override
  List<Object?> get props => [id, title, documentIds, unit, imagePath];

  UnitQuestionsModel copyWith({
    String? id,
    List<dynamic>? documentIds,
    String? title,
    int? unit,
    String? imagePath,
  }) {
    return UnitQuestionsModel(
        id: id ?? this.id,
        documentIds: documentIds ?? this.documentIds,
        title: title ?? this.title,
        unit: unit ?? this.unit,
        imagePath: imagePath ?? this.imagePath);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'documentIds': documentIds,
      'title': title,
      'unit': unit,
      'imagePath': imagePath,
    };
  }

  @override
  UnitQuestionsModel fromJson(Map<String, dynamic> json) {
    return UnitQuestionsModel(
      id: json['id'] as String?,
      documentIds: json['documentIds'] as List<dynamic>?,
      title: json['title'] as String?,
      unit: json['unit'] as int?,
      imagePath: json['imagePath'] as String?,
    );
  }
}
