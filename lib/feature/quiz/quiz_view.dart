import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_architecture/core/view/base_view.dart';
import 'package:riverpod_architecture/feature/quiz/components/answer_buton.dart';
import 'package:riverpod_architecture/feature/quiz/components/next_button.dart';
import 'package:riverpod_architecture/feature/quiz/components/question_container.dart';
import 'package:riverpod_architecture/feature/quiz/model/questions.dart';
import 'package:riverpod_architecture/feature/quiz/quiz_provider.dart';
import 'package:riverpod_architecture/product/constants/color_constants.dart';
import 'package:riverpod_architecture/product/constants/image_constants.dart';
import 'package:riverpod_architecture/product/constants/string_constants.dart';
import 'package:kartal/kartal.dart';
import 'package:google_fonts/google_fonts.dart';

class QuizView extends StatelessWidget {
  const QuizView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final quizProvider = StateNotifierProvider<QuizNotifier, QuizState>((ref) {
      return QuizNotifier();
    });

    return BaseView<QuizNotifier, QuizState>(onInitState: (WidgetRef ref) {
      ref.read(quizProvider.notifier).loadQuestions();
    }, onPageBuilder: (BuildContext context, WidgetRef ref) {
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
    });
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

bool questionCheck(int questionIndex, int correctAnswerIndex) {
  if (questionIndex == correctAnswerIndex) {
    return true;
  } else {
    return false;
  }
}

/*

class QuizView extends ConsumerStatefulWidget {
  const QuizView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _QuizViewState();
}

class _QuizViewState extends ConsumerState<QuizView> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(_quizNotifier.notifier).loadQuestions();
    });
  }

  @override
  Widget build(BuildContext context) {
    final quizState = ref.watch(_quizNotifier);

    Questions? currentQuestion = quizState.questions?[quizState.currentIndex];

    return        Scaffold(
      backgroundColor: Color(ColorConstants.ligthGrey.toRgba),
      appBar: AppBar(
        leadingWidth: 100,
        leading: Row(
          children: [
            IconButton(
                onPressed: () {
                  ref.read(_quizNotifier.notifier).previousQuestion();
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
                    quizProvider: _quizNotifier,
                    currentQuestion: currentQuestion,
                    quizState: quizState,
                    ref: ref,
                    answerIndex: index),
              );
            },
          ),
          Padding(padding: context.padding.verticalLow), // fixme

          NextButton(ref: ref, quizProvider: _quizNotifier),
        ],
      ),
    );
  }
}



 */
