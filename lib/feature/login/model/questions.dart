import 'package:cloud_firestore/cloud_firestore.dart';

import 'answers.dart';

class Questions {
  String? id;
  String? questionTitle;
  String? question;
  Timestamp? date; // Değişiklik burada
  Answers? answers;
  int? correctQuestionIndex;
  String? imagePath;

  Questions({
    this.id,
    this.questionTitle,
    this.question,
    this.date,
    this.answers,
    this.correctQuestionIndex,
    this.imagePath,
  });

  Questions.fromJson(Map<String, dynamic> json) {
    id = json['id'] as String?;
    questionTitle = json['questionTitle'] as String?;
    question = json['question'] as String?;
    date = json['date'] as Timestamp?; // Değişiklik burada
    answers =
        json['answers'] != null ? Answers.fromJson(json['answers']) : null;
    correctQuestionIndex = json['correctQuestionIndex'] as int?;
    imagePath = json['imagePath'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['questionTitle'] = questionTitle;
    data['question'] = question;
    data['date'] = date; // Değişiklik burada
    if (answers != null) {
      data['answers'] = answers!.toJson();
    }
    data['correctQuestionIndex'] = correctQuestionIndex;
    data['imagePath'] = imagePath;
    return data;
  }

  Questions copyWith({
    String? id,
    String? questionTitle,
    String? question,
    Timestamp? date,
    Answers? answers,
    int? correctQuestionIndex,
    String? imagePath,
  }) {
    return Questions(
      id: id ?? this.id,
      questionTitle: questionTitle ?? this.questionTitle,
      question: question ?? this.question,
      date: date ?? this.date,
      answers: answers ?? this.answers,
      correctQuestionIndex: correctQuestionIndex ?? this.correctQuestionIndex,
      imagePath: imagePath ?? this.imagePath,
    );
  }
}
