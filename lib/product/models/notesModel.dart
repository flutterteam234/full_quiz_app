import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:riverpod_architecture/product/models/subNotesModel.dart';
import 'package:riverpod_architecture/product/utility/base/base_firebase_model.dart';

@immutable
class NotesModel extends Equatable with IdModel, BaseFirebaseModel<NotesModel> {
  const NotesModel(
      {this.id, this.title, this.subNotes, this.unit, this.imagePath});

  final String? title;
  final SubNotesModel? subNotes;
  final int? unit;
  final String? imagePath;

  @override
  final String? id;

  @override
  List<Object?> get props => [id, title, subNotes, unit, imagePath];

  NotesModel copyWith({
    String? id,
    SubNotesModel? subNotes,
    String? title,
    int? unit,
    String? imagePath,
  }) {
    return NotesModel(
        id: id ?? this.id,
        subNotes: subNotes ?? this.subNotes,
        title: title ?? this.title,
        unit: unit ?? this.unit,
        imagePath: imagePath ?? this.imagePath);
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'subNotes': subNotes,
      'title': title,
      'unit': unit,
      'imagePath': imagePath,
    };
  }

  @override
  NotesModel fromJson(Map<String, dynamic> json) {
    return NotesModel(
      id: json['id'] as String?,
      subNotes: json['subNotes'] as SubNotesModel?,
      title: json['title'] as String?,
      unit: json['unit'] as int?,
      imagePath: json['imagePath'] as String?,
    );
  }
}
