import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';

import 'package:riverpod_architecture/product/utility/extentions/context_extentions.dart';

import '../../../product/constants/color_constants.dart';
import '../../../product/constants/image_constants.dart';
import '../../../product/widget/text/locale_text.dart';

class AppLanguageContainer extends StatelessWidget {
  const AppLanguageContainer(
      {Key? key,
      this.function,
      required this.languageLocale,
      required this.flagImageAsset,
      required this.languageName})
      : super(key: key);

  final ImageConstants flagImageAsset;
  final String languageName;
  final Locale languageLocale;
  final Function()? function;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Container(
        padding: context.padding.low,
        alignment: Alignment.center,
        height: context.sized.dynamicHeight(0.125),
        decoration: BoxDecoration(
            color: ColorConstants.smootWhite.getColor,
            borderRadius: BorderRadius.circular(25.0)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                Container(
                  width: context.customSized.mediumHighValue,
                  height: context.customSized.mediumHighValue,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(context.sized.highValue)),
                  child: Image.asset(
                    fit: BoxFit.cover,
                    flagImageAsset.toImage,
                  ),
                ),
                Padding(padding: context.padding.horizontalLow),
                LocaleText(
                  text: languageName,
                  textStyle: GoogleFonts.baloo2(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: context.sized.mediumValue,
              width: context.sized.mediumValue,
              child: Icon(
                isSelectedLanguage(context)
                    ? Icons.circle
                    : Icons.circle_outlined,
                color: ColorConstants.smootGreen.getColor,
                size: context.sized.mediumValue,
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool isSelectedLanguage(BuildContext context) {
    if (context.locale == languageLocale) {
      return true;
    } else {
      return false;
    }
  }
}
