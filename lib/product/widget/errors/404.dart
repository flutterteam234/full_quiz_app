import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';
import 'package:riverpod_architecture/product/constants/color_constants.dart';
import 'package:riverpod_architecture/product/constants/image_constants.dart';
import 'package:riverpod_architecture/product/constants/string_constants.dart';

class Error404 extends StatelessWidget {
  const Error404({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            ImageConstants.error404Image.toImage,
            height: context.sized.dynamicHeight(0.4),
            width: context.sized.dynamicWidth(0.6),
          ),
          Column(
            children: [
              Text(
                StringConstants.ohNo,
                style: GoogleFonts.dmSans(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(ColorConstants.darkBlue.toRgba),
                ),
              ),
              Padding(padding: context.padding.verticalLow),
              SizedBox(
                width: context.sized.dynamicWidth(0.8),
                child: Text(
                  StringConstants.backtoHomePageLong,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.dmSans(
                      color: Color(ColorConstants.lightGreyText.toRgba),
                      fontSize: 14),
                ),
              ),
            ],
          ),
          Padding(padding: context.padding.verticalNormal),
          Container(
            padding: context.padding.verticalLow,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Color(ColorConstants.smootGreen.toRgba),
            ),
            width: context.sized.dynamicWidth(0.7),
            alignment: Alignment.center,
            child: Text(
              StringConstants.backtoHomePageShort,
              style: GoogleFonts.dmSans(
                  fontSize: 15,
                  color: Color(ColorConstants.white.toRgba),
                  fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    ));
  }
}
