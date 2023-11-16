import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_architecture/feature/login/login_provider.dart';
import 'package:riverpod_architecture/feature/login/model/questions.dart';
import 'package:riverpod_architecture/feature/quiz/quiz_provider.dart';
import 'package:riverpod_architecture/product/constants/color_constants.dart';
import 'package:riverpod_architecture/product/constants/image_constants.dart';
import 'package:riverpod_architecture/product/constants/string_constants.dart';
import 'package:riverpod_architecture/product/utility/exceptions/custom_exceptions.dart';
import 'package:kartal/kartal.dart';
import 'package:google_fonts/google_fonts.dart';

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
        //await Future.delayed(Duration(seconds: 2));
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
                onPressed: () {},
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
        title: Text("Number"),
      ),
      body: quizState.isLoading
          ? CircularProgressIndicator()
          : currentQuestion == null
              ? Text("Soru yok")
              : ListView(
                  padding: context.padding.normal,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      padding: context.padding.high,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 20,
                            spreadRadius: -20,
                            offset: Offset(1, 1),
                            color: Color(ColorConstants.black.toRgba),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(20.0),
                        color: Color(ColorConstants.white.toRgba),
                      ),
                      child: Text(
                        currentQuestion.question!,
                        style: GoogleFonts.baloo2(
                            fontSize: 20,
                            color: Color(ColorConstants.black.toRgba)),
                      ),
                    ),
                    Padding(padding: context.padding.verticalMedium), // fixme
                    _QuestionOption(
                        currentQuestion.answers!.s1,
                        questionCheck(
                            0, currentQuestion.correctQuestionIndex!)),
                    _QuestionOption(
                        currentQuestion.answers!.s2,
                        questionCheck(
                            1, currentQuestion.correctQuestionIndex!)),
                    _QuestionOption(
                        currentQuestion.answers!.s3,
                        questionCheck(
                            2, currentQuestion.correctQuestionIndex!)),
                    _QuestionOption(
                        currentQuestion.answers!.s4,
                        questionCheck(
                            3, currentQuestion.correctQuestionIndex!)),
                  ],
                ),
    );
  }

  bool questionCheck(int questionIndex, int correctAnswerIndex) {
    if (questionIndex == correctAnswerIndex) {
      return true;
    } else {
      return false;
    }
  }
}

class _QuestionOption extends StatelessWidget {
  const _QuestionOption(this.currentQuestion, this.isCorrect);

  final String? currentQuestion;
  final bool? isCorrect;

  @override
  Widget build(BuildContext context) {
    print(isCorrect);
    return Container(
      decoration: BoxDecoration(
          color: Color(ColorConstants.white.toRgba),
          borderRadius: BorderRadius.circular(20)),
      child: CheckboxListTile(
        enabled: true,
        fillColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return Color(ColorConstants.ligthGrey.toRgba);
            }
            return Color(ColorConstants.ligthGreen.toRgba);
          },
        ),
        onChanged: (bool? value) {},
        value: true,
        title: Text(
          currentQuestion!,
          style: GoogleFonts.baloo2(
            fontWeight: FontWeight.bold,
            color: Color(ColorConstants.black.toRgba),
          ),
        ),
      ),
    );
  }
}

/*
class _logo extends StatelessWidget {
  const _logo();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: context.padding.medium,
        child: Image.asset(ImageConstants.appIcon.toIcon));
  }
}
*/
