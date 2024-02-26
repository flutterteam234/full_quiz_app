import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:riverpod_architecture/feature/quiz/model/questions.dart';
import 'package:riverpod_architecture/product/database/core/hive_types.dart';
import 'package:riverpod_architecture/product/database/model/hive_model.dart';

part 'quiz_hive_model.g.dart';


@HiveType(typeId: HiveTypes.quizModelId)
@immutable
class QuizHiveModel with HiveModelMixin {
  QuizHiveModel({
    this.quizModels,
  });

  @HiveField(0)
  final List<Questions?>? quizModels;

  QuizHiveModel copyWith({
    String? id,
  }) {
    return QuizHiveModel(
      quizModels: quizModels ?? quizModels,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'quizModels': quizModels,
    };
  }

  QuizHiveModel fromJson(Map<String, dynamic> json) {
    return QuizHiveModel(
      quizModels: json['quizModels'] as List<Questions?>?,
    );
  }

  @override
  String get key => HiveTypes.quizModelKey;
}
