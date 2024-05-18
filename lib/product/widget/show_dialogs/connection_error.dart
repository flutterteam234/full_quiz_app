import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';
import 'package:riverpod_architecture/generated/locale_keys.g.dart';
import 'package:riverpod_architecture/product/widget/text/locale_text.dart';

import '../../constants/color_constants.dart';

class ConnectionError extends StatelessWidget {
  const ConnectionError({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstants.smootGreen.getColor,
        body: Center(
          child: Container(
            width: context.sized.dynamicWidth(0.8),
            height: context.sized.dynamicHeight(0.3),
            decoration: BoxDecoration(
              color: ColorConstants.smootWhite.getColor,
              borderRadius: BorderRadius.circular(20.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            padding: context.padding.normal,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LocaleText(
                    text: LocaleKeys.errorMessages_connectionLost,
                    textStyle: GoogleFonts.baloo2(
                        fontSize: 20, color: ColorConstants.black.getColor)),
                LocaleText(
                    text: LocaleKeys.errorMessages_connectionLostMessage,
                    textAlign: TextAlign.center,
                    textStyle: GoogleFonts.baloo2(
                        fontSize: 16, color: ColorConstants.black.getColor)),
                Align(
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.signal_wifi_statusbar_connected_no_internet_4,
                    color: ColorConstants.black.getColor,
                    size: 25,
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
