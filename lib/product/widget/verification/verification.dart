import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';
import 'package:riverpod_architecture/generated/locale_keys.g.dart';
import 'package:riverpod_architecture/product/constants/color_constants.dart';
import 'package:riverpod_architecture/product/constants/settings_constants.dart';
import 'package:riverpod_architecture/product/widget/text/locale_text.dart';



class Verification extends StatefulWidget {
  const Verification({Key? key}) : super(key: key);

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  dynamic _code;
  dynamic _onEditing;

  @override
  Widget build(BuildContext context) {
    return VerificationCode(
      textStyle: GoogleFonts.baloo2(
          fontSize: 20, color: ColorConstants.smootGreen.getColor),
      keyboardType: TextInputType.number,
      underlineColor: Colors.amber,
      length: SettingsConstants.verificationLenght,
      cursorColor: Colors.blue,
      clearAll: Padding(
        padding: context.padding.normal,
        child: LocaleText(
          text: LocaleKeys.verification_clearAll,
          textStyle: GoogleFonts.baloo2(
              color: ColorConstants.black.getColor,
              fontWeight: FontWeight.w500),
        ),
      ),
      onCompleted: (String value) {
        setState(() {
          _code = value;
        });
      },
      onEditing: (bool value) {
        setState(() {
          _onEditing = value;
        });
        if (!_onEditing) FocusScope.of(context).unfocus();
      },
    );
  }
}


