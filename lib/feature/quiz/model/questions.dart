import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:riverpod_architecture/core/model/base_model.dart';
import '../../../product/utility/base/base_firebase_model.dart';
import 'answers.dart';

@immutable
class Questions extends Equatable with IdModel, BaseFirebaseModel<Questions> implements BaseModel {
  Questions({
    this.id,
    this.questionTitle,
    this.question,
    this.date,
    this.answers,
    this.correctQuestionIndex,
  });


  final String? questionTitle;
  final String? question;
  final Timestamp? date;
  final Answers? answers;
  final int? correctQuestionIndex;
  @override
  final String? id;

  @override
  List<Object?> get props => [id];

  Questions copyWith({
    String? id,
    String? questionTitle,
    String? question,
    Timestamp? date,
    Answers? answers,
    int? correctQuestionIndex,
  }) {
    return Questions(
      id: id ?? this.id,
      questionTitle: questionTitle ?? this.questionTitle,
      question: question ?? this.question,
      date: date ?? this.date,
      answers: answers ?? this.answers,
      correctQuestionIndex: correctQuestionIndex ?? this.correctQuestionIndex,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'questionTitle': questionTitle,
      'question': question,
      'date': date,
      'answers': answers?.toJson(),
      'correctQuestionIndex': correctQuestionIndex,
    };
  }

  @override
  Questions fromJson(Map<String, dynamic> json) {
    return Questions(
        id: json['id'] as String?,
        questionTitle: json['questionTitle'] as String?,
        question: json['question'] as String?,
        date: json['date'] as Timestamp?,
        answers:
            json['answers'] != null ? Answers.fromJson(json['answers']) : null,
        correctQuestionIndex: json['correctQuestionIndex'] as int?);
  }
}

