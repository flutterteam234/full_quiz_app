import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kartal/kartal.dart';
import 'package:riverpod_architecture/core/view/base_view.dart';
import 'package:riverpod_architecture/feature/notes/components/notes_container.dart';
import 'package:riverpod_architecture/feature/quiz/provider/quiz_main_provider.dart';
import 'package:riverpod_architecture/feature/quiz/provider/quiz_provider.dart';
import 'package:riverpod_architecture/generated/locale_keys.g.dart';
import 'package:riverpod_architecture/product/constants/color_constants.dart';
import 'package:riverpod_architecture/product/models/unitQuestionsModel.dart';
import 'package:riverpod_architecture/product/navigation/enum/router_items.dart';
import 'package:riverpod_architecture/product/navigation/router.dart';
import 'package:riverpod_architecture/product/widget/appbars/custom_app_bar.dart';

class QuizMainView extends StatelessWidget {
  const QuizMainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final quizMainProvider =
        StateNotifierProvider<QuizMainNotifier, QuizMainState>((ref) {
      return QuizMainNotifier();
    });

    return BaseView<QuizNotifier, QuizState>(onInitState: (WidgetRef ref) {
      ref.read(quizMainProvider.notifier).getUnitQuestions();
    }, onPageBuilder: (BuildContext context, WidgetRef ref) {
      final QuizMainState quizMainState = ref.watch(quizMainProvider);
      final QuizMainNotifier quizMainNotifier =
          ref.read(quizMainProvider.notifier);

      return Scaffold(
          backgroundColor: ColorConstants.smootGreen.getColor,
          appBar: CustomAppBar(
              subTitle: LocaleKeys.pages_quiz,
              function: () {
                Navigator.push(context, RouterItems.home.goScreen());
              }),
          body: _getBody(context, quizMainState, quizMainNotifier));
    });
  }
}

Widget _getBody(BuildContext context, QuizMainState quizMainState,
    QuizMainNotifier quizMainNotifier) {
  if (quizMainState.isLoading) {
    return const LinearProgressIndicator();
  } else {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: ListView.builder(
          padding: context.padding.low,
          shrinkWrap: true,
          itemCount: quizMainState.unitQuestions!.length,
          itemBuilder: (BuildContext context, int index) {
            UnitQuestionsModel? unitQuestionsModel =
                quizMainState.unitQuestions![index];
            return NotesContainer(
                backgroundImagePath: unitQuestionsModel!.imagePath!,
                title: unitQuestionsModel.title!,
                function: () {
                  Navigator.push(
                      context,
                      RouterItems.quiz
                          .goScreen(unitQuestionsModel: unitQuestionsModel));
                });
          }),
    );
  }
}
