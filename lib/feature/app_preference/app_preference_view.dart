import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:riverpod_architecture/core/view/base_view.dart';
import 'package:riverpod_architecture/generated/locale_keys.g.dart';
import 'package:riverpod_architecture/product/constants/image_constants.dart';
import 'package:riverpod_architecture/product/navigation/enum/router_items.dart';
import 'package:riverpod_architecture/product/navigation/router.dart';
import 'package:riverpod_architecture/product/widget/text/locale_text.dart';

import '../../product/constants/color_constants.dart';

class AppPreferenceView extends StatelessWidget {
  const AppPreferenceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView(onPageBuilder: (BuildContext context, WidgetRef ref) {
      return Scaffold(
          backgroundColor: ColorConstants.smootGreen.getColor,
          appBar: _getAppBar(context),
          body: _getBody(context));
    });
  }



  Widget _getBody(BuildContext context) {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: ListView(
        shrinkWrap: true,
        padding: context.padding.normal,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Container(
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
                    Image.asset(
                      ImageConstants.moonIcon.toIcon,
                      width: context.sized.highValue,
                      height: context.sized.highValue,
                    ),
                    Padding(padding: context.padding.horizontalLow),
                    LocaleText(
                      text: LocaleKeys.appPreference_darkMode,
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
                  child: Switch(
                    value: true,
                    onChanged: (value) {},
                    activeColor: Colors.black,
                    activeTrackColor: Colors.grey,
                    inactiveThumbColor: Colors.white,
                    inactiveTrackColor: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          Padding(padding: context.padding.verticalLow),
          InkWell(
            child:         Container(
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
                      Image.asset(
                        ImageConstants.globalIcon.toIcon,
                        width: context.sized.highValue,
                        height: context.sized.highValue,
                      ),
                      Padding(padding: context.padding.horizontalLow),
                      LocaleText(
                        text: LocaleKeys.appPreference_language,
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
                      child: InkWell(
                        child: Icon(
                          MdiIcons.arrowRight,
                          color: ColorConstants.black.getColor,
                          size: context.sized.mediumValue,
                        ),
                      )),
                ],
              ),
            ),
            onTap: (){
              Navigator.push(context, RouterItems.appLanguage.goScreen());
            },
          ),
        ],
      ),
    );
  }

  PreferredSizeWidget _getAppBar(BuildContext context) {
    return AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        leadingWidth: 100,
        title: Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.keyboard_arrow_left_sharp,
                color: Color(ColorConstants.smootWhite.toRgba),
              ),
              iconSize: 40,
              color: Color(ColorConstants.black.toRgba),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LocaleText(
                  text: LocaleKeys.general_app,
                  textStyle: GoogleFonts.baloo2(
                      fontWeight: FontWeight.w500,
                      wordSpacing: 1,
                      fontSize: 17,
                      color: ColorConstants.lightSilver.getColor),
                ),
                LocaleText(
                  text: LocaleKeys.appSettings_preference,
                  textStyle: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5,
                      color: ColorConstants.smootWhite.getColor),
                )
              ],
            ),
          ],
        ));
  }
}
