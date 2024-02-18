import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';

import '../../../generated/locale_keys.g.dart';
import '../../../product/constants/color_constants.dart';
import '../../../product/constants/image_constants.dart';
import '../../../product/widget/text/locale_text.dart';
import '../splash_provider.dart';

class AppIsOffPopUp extends StatelessWidget {
  const AppIsOffPopUp({Key? key, required this.notifier}) : super(key: key);

  final SplashNotifier notifier;

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
        padding: context.padding.normal +
            context.padding.verticalHigh +
            context.padding.verticalHigh,
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
            child: Image.asset(
              fit: BoxFit.contain,
              ImageConstants.serverOff.toImage,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: context.padding.normal,
              child: LocaleText(
                  text: LocaleKeys.splash_serverOff,
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
                  text: LocaleKeys.splash_serverOffMessage,
                  textAlign: TextAlign.justify,
                  textStyle: GoogleFonts.baloo2(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  )),
            ),
          ),
          Padding(
              padding: context.padding.horizontalHigh +
                  context.padding.verticalNormal,
              child: ElevatedButton.icon(
                onPressed: () {
                  notifier.appInit(context);
                },
                icon: Icon(
                  Icons.refresh,
                  color: ColorConstants.lightBlue.getColor,
                  size: context.sized.mediumValue,
                ),
                label: LocaleText(
                  text: LocaleKeys.splash_refresh,
                  textStyle: GoogleFonts.baloo2(
                    color: ColorConstants.black.getColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                ),
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(
                      Size(100, context.sized.dynamicHeight(0.1))),
                ),
              )),
        ],
      ),
    );
  }
}
