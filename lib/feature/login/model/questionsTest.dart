import 'package:cloud_firestore/cloud_firestore.dart';

import 'answersTest.dart';

class QuestionsTest {
  String? id;
  String? questionTitle;
  String? question;
  Timestamp? date; // Değişiklik burada
  AnswersTest? answers;
  int? correctQuestionIndex;
  String? imagePath;

  QuestionsTest({
    this.id,
    this.questionTitle,
    this.question,
    this.date,
    this.answers,
    this.correctQuestionIndex,
    this.imagePath,
  });

  QuestionsTest.fromJson(Map<String, dynamic> json) {
    id = json['id'] as String?;
    questionTitle = json['questionTitle'] as String?;
    question = json['question'] as String?;
    date = json['date'] as Timestamp?; // Değişiklik burada
    answers =
        json['answers'] != null ? AnswersTest.fromJson(json['answers']) : null;
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

  QuestionsTest copyWith({
    String? id,
    String? questionTitle,
    String? question,
    Timestamp? date,
    AnswersTest? answers,
    int? correctQuestionIndex,
    String? imagePath,
  }) {
    return QuestionsTest(
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
