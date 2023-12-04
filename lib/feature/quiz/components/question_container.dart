import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';

import '../../../product/constants/color_constants.dart';
import '../model/questions.dart';

class QuestionContainer extends StatelessWidget {
  const QuestionContainer({Key? key, required this.currentQuestion})
      : super(key: key);

  final Questions? currentQuestion;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        borderRadius: BorderRadius.circular(20.0),
        onTap: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return _FullQuestionTextPopUp(
                    currentQuestion: currentQuestion!);
              });
        },
        child: Container(alignment: Alignment.center,

          padding: EdgeInsets.symmetric(horizontal: context.sized.lowValue, vertical: context.sized.mediumValue),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                blurRadius: 20,
                spreadRadius: -20,
                offset: const Offset(1, 1),
                color: Color(ColorConstants.black.toRgba),
              ),
            ],
            borderRadius: BorderRadius.circular(20.0),
            color: Color(ColorConstants.white.toRgba),
          ),
          child: Text(
            textAlign: TextAlign.justify,
            overflow: TextOverflow.fade,
            currentQuestion!.question!,
            style: GoogleFonts.baloo2(
                fontSize: 18, color: Color(ColorConstants.black.toRgba)),
          ),
        ));
  }
}

class _FullQuestionTextPopUp extends StatelessWidget {
  const _FullQuestionTextPopUp({required this.currentQuestion});

  final Questions currentQuestion;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      //title: Text("Soru Detayı"),
      content: SingleChildScrollView(
        child: Text(
          currentQuestion.question!,
          style: GoogleFonts.baloo2(
            fontSize: 18,
            color: Color(ColorConstants.black.toRgba),
          ),
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text("Kapat"),
        ),
      ],
    );
  }
}
