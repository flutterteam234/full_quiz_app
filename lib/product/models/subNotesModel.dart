import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:riverpod_architecture/product/utility/base/base_firebase_model.dart';

@immutable
class SubNotesModel extends Equatable
    with IdModel, BaseFirebaseModel<SubNotesModel> {
  const SubNotesModel({
    this.id,
    this.notePaths,
    this.imagePaths,
    this.titles,
  });

  final List<dynamic>? notePaths;
  final List<dynamic>? imagePaths;
  final List<dynamic>? titles;

  @override
  final String? id;

  @override
  List<Object?> get props => [id];

  SubNotesModel copyWith({
    String? id,
    List<dynamic>? notePaths,
    List<dynamic>? imagePaths,
    List<dynamic>? titles,

  }) {
    return SubNotesModel(
      id: id ?? this.id,
      notePaths: notePaths ?? this.notePaths,
      imagePaths: imagePaths ?? this.imagePaths,
      titles: titles ?? this.titles,

    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'titles': titles,
      'notePaths': notePaths,
      'imagePaths': imagePaths,
    };
  }

  @override
  SubNotesModel fromJson(Map<String, dynamic> json) {
    return SubNotesModel(
      id: json['id'] as String?,
      imagePaths: json['imagePaths'] as List<dynamic>?,
      notePaths: json['notePaths'] as List<dynamic>?,
      titles: json['titles'] as List<dynamic>?,
    );
  }
}
