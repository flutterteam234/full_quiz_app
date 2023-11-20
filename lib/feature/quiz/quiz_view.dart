import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_architecture/feature/login/login_provider.dart';
import 'package:riverpod_architecture/feature/login/model/questions.dart';
import 'package:riverpod_architecture/feature/quiz/components/answer_buton.dart';
import 'package:riverpod_architecture/feature/quiz/components/next_button.dart';
import 'package:riverpod_architecture/feature/quiz/components/question_container.dart';
import 'package:riverpod_architecture/feature/quiz/quiz_provider.dart';
import 'package:riverpod_architecture/product/constants/color_constants.dart';
import 'package:riverpod_architecture/product/constants/image_constants.dart';
import 'package:riverpod_architecture/product/constants/string_constants.dart';
import 'package:riverpod_architecture/product/utility/exceptions/custom_exceptions.dart';
import 'package:kartal/kartal.dart';
import 'package:google_fonts/google_fonts.dart';

bool questionCheck(int questionIndex, int correctAnswerIndex) {
  if (questionIndex == correctAnswerIndex) {
    return true;
  } else {
    return false;
  }
}

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
        await Future.delayed(const Duration(seconds: 1));
        ref.read(quizProvider.notifier).setLoading(false);
      }
    } catch (error) {
      throw FirebaseCustomExceptions('$error null');
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

    Questions? currentQuestion = quizState.questions?[quizState.currentIndex];

    return Scaffold(
      backgroundColor: Color(ColorConstants.ligthGrey.toRgba),
      appBar: AppBar(
        leadingWidth: 100,
        leading: Row(
          children: [
            IconButton(
                onPressed: () {
                  ref.read(quizProvider.notifier).previousQuestion();
                },
                icon: ImageConstants.leftRoundedIcon.toIconAsset,
                color: Color(ColorConstants.black.toRgba)),
            Text(StringConstants.provious,
                style: TextStyle(
                    color: Color(ColorConstants.ligthGreen.toRgba),
                    fontSize: 12,
                    fontWeight: FontWeight.bold)),
          ],
        ),
        centerTitle: true,
        title: _QuestionNumberText(
          quizState: quizState,
        ),
      ),
      body: quizState.isLoading
          ? const Center(
              child: LinearProgressIndicator(),
            )
          : currentQuestion == null
              ? const Text("Soru yok")
              : ListView(
                  padding: context.padding.normal,
                  children: [
                    QuestionContainer(currentQuestion: currentQuestion),

                    Padding(padding: context.padding.verticalMedium), // fixme

                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: context.padding.verticalLow,
                          child: AnswerButton(
                              quizProvider: quizProvider,
                              currentQuestion: currentQuestion,
                              quizState: quizState,
                              ref: ref,
                              answerIndex: index),
                        );
                      },
                    ),
                    Padding(padding: context.padding.verticalLow), // fixme

                    NextButton(ref: ref, quizProvider: quizProvider),
                  ],
                ),
    );
  }
}

class _QuestionNumberText extends StatelessWidget {
  // ismi değiştir
  const _QuestionNumberText({required this.quizState});

  final QuizState? quizState;

  @override
  Widget build(BuildContext context) {
    String text = getText();
    return Text(
      text,
      style: GoogleFonts.baloo2(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        letterSpacing: 1,
      ),
    );
  }

  String getText() {
    if (quizState == null || quizState!.questions == null) {
      return '0/0';
    } else {
      return '${quizState!.currentIndex + 1}/${quizState!.questions!.length}';
    }
  }
}
