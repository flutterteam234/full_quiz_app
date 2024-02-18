import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:riverpod_architecture/generated/locale_keys.g.dart';
import 'package:riverpod_architecture/product/constants/color_constants.dart';
import 'package:riverpod_architecture/product/constants/image_constants.dart';
import 'package:kartal/kartal.dart';
import 'package:riverpod_architecture/product/widget/text/locale_text.dart';

class ForceUpdatePopUp extends StatelessWidget {
  const ForceUpdatePopUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.sized.dynamicHeight(1),
      width: context.sized.dynamicWidth(1),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: ColorConstants.shadowBlack.getColor,
              offset: const Offset(0, 0),
              blurRadius: 15,
              spreadRadius: 0.5,
            ),
          ],
          borderRadius: BorderRadius.circular(25.0),
          color: ColorConstants.smootWhite.getColor),
      child: ListView(
        padding: context.padding.normal + context.padding.verticalHigh,
        children: [
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: ColorConstants.shadowBlack.getColor,
                  offset: const Offset(0, 0),
                  blurRadius: 15,
                  spreadRadius: 0.5,
                ),
              ],
            ),
            child:  Image.asset(

              fit: BoxFit.contain,
              ImageConstants.warning.toImage,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: context.padding.normal,
              child: LocaleText(
                  text: LocaleKeys.splash_timeToUpdate,
                  textStyle: GoogleFonts.baloo2(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                  )),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: context.padding.low,
              child: LocaleText(
                  text: LocaleKeys.splash_updateMessage,
                  textAlign: TextAlign.justify,
                  textStyle: GoogleFonts.baloo2(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  )),
            ),
          ),
          Column(
            children: [
              Padding(
                padding: context.padding.normal,
                child: InkWell(
                  child: Container(
                    decoration: BoxDecoration(
                        color: ColorConstants.smootWhite.getColor,
                        borderRadius: BorderRadius.circular(12.0),
                        border: Border.all(
                            width: 2, color: ColorConstants.black.getColor)),
                    alignment: Alignment.center,
                    height: context.sized.dynamicHeight(0.08),
                    width: context.sized.dynamicWidth(0.4),
                    child: LocaleText(
                      text: LocaleKeys.splash_update,
                      textStyle: GoogleFonts.baloo2(
                          fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: context.padding.low,
                child: InkWell(
                    child: LocaleText(
                  text: LocaleKeys.general_exit,
                  textStyle: GoogleFonts.baloo2(
                    color: ColorConstants.lightBlue.getColor,
                      fontWeight: FontWeight.bold, fontSize: 18),
                )),
              )
            ],
          )
        ],
      ),
    );
  }
}
