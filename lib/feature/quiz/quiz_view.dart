import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_architecture/feature/login/login_provider.dart';
import 'package:riverpod_architecture/feature/login/model/questions.dart';
import 'package:riverpod_architecture/feature/quiz/quiz_provider.dart';
import 'package:riverpod_architecture/product/utility/exceptions/custom_exceptions.dart';

class QuizView extends ConsumerStatefulWidget {
  const QuizView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _QuizViewState();
}

class _QuizViewState extends ConsumerState<QuizView> {
  final quizProvider = StateNotifierProvider<QuizNotifier, QuizState>((ref) {
    return QuizNotifier();
  });

  void addQuestion(List<Questions?> questions) {
    ref.read(quizProvider.notifier).addQuestions(questions);
  }

  Future<void> loadQuestions() async {
    try {
      CollectionReference questions =
      FirebaseFirestore.instance.collection('questions');

      final response = await questions.withConverter<Questions?>(
        fromFirestore: (snapshot, options) {
          final jsonBody = snapshot.data();

          if (jsonBody != null) {
            return Questions.fromJson(jsonBody)..copyWith(id: snapshot.id);
          }
          return null;
        },
        toFirestore: (value, options) {
          if (value == null) throw FirebaseCustomExceptions('$value not null');
          return value.toJson();
        },
      ).get();

      if (response.docs.isNotEmpty) {
        final value = response.docs.map((e) => e.data()).toList();
        addQuestion(value);
      }
    } catch (error) {
      print("Hata: $error");
    }
  }

  @override
  void initState() {
    super.initState();
    loadQuestions();
  }

  @override
  Widget build(BuildContext context) {

    final quizState = ref.watch(quizProvider);

    return  Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: quizState.questions?.length ?? 0,
        itemBuilder: (BuildContext context, int index) {
          final question = quizState.questions?[index];

          if (question != null) {
            return ListTile(
              title: Text(question.question.toString()),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
