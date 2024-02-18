import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';
import 'package:riverpod_architecture/core/view/base_view.dart';
import 'package:riverpod_architecture/feature/app_language/components/app_language_container.dart';
import 'package:riverpod_architecture/feature/app_language/enum/language_enum.dart';
import 'package:riverpod_architecture/product/constants/settings_constants.dart';
import 'package:riverpod_architecture/product/init/app_cache.dart';
import '../../generated/locale_keys.g.dart';
import '../../product/constants/color_constants.dart';
import '../../product/constants/image_constants.dart';
import '../../product/widget/text/locale_text.dart';



class AppLanguageView extends StatelessWidget {
  const AppLanguageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return BaseView(onInitState: (WidgetRef widgetRef) {
    }, onPageBuilder: (BuildContext context, WidgetRef ref) {
      return Scaffold(
        backgroundColor: ColorConstants.smootGreen.getColor,
        appBar: _getAppBar(context),
        body: _getBody(context),
      );
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
          AppLanguageContainer(
              languageLocale: SettingsConstants.TR_LOCALE,
              function: () {
                // bir araya getir.
                AppCache.instance.saveLanguage(LanguageEnum.tr);
                LanguageEnum.tr.generateLanguage(context);
              },
              flagImageAsset: ImageConstants.flagTr,
              languageName: LocaleKeys.appLanguage_turkish),
          Padding(padding: context.padding.verticalLow),
          AppLanguageContainer(
              languageLocale: SettingsConstants.EN_LOCALE,
              function: () {
                AppCache.instance.saveLanguage(LanguageEnum.en);
                LanguageEnum.en.generateLanguage(context);
              },
              flagImageAsset: ImageConstants.flagUs,
              languageName: LocaleKeys.appLanguage_english),
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
                  text: LocaleKeys.appPreference_language,
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
