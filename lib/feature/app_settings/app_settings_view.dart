import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';
import 'package:riverpod_architecture/core/view/base_view.dart';
import 'package:riverpod_architecture/feature/app_settings/components/change_photo_circle_avatar.dart';
import 'package:riverpod_architecture/feature/app_settings/components/user_mail_text.dart';
import 'package:riverpod_architecture/feature/app_settings/components/user_name_text.dart';
import 'package:riverpod_architecture/product/constants/color_constants.dart';
import 'package:riverpod_architecture/product/constants/string_constants.dart';

import '../../product/navigation/enum/router_items.dart';

class AppSettingsView extends StatelessWidget {
  const AppSettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView(onPageBuilder: (BuildContext context, WidgetRef ref) {
      return Scaffold(
        backgroundColor: ColorConstants.smootGreen.getColor,
        appBar: _getAppBar(context),
        body: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: ListView(
            shrinkWrap: true,
            padding: context.padding.normal,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              _getEditProfileContainer(context),
            ],
          ),
        ),
      );
    });
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
                Text(
                  StringConstants.app,
                  style: GoogleFonts.baloo2(
                      fontWeight: FontWeight.w500,
                      wordSpacing: 1,
                      fontSize: 17,
                      color: ColorConstants.lightSilver.getColor),
                ),
                Text(
                  StringConstants.settings,
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5,
                      color: ColorConstants.smootWhite.getColor),
                ),
              ],
            ),
          ],
        ));
  }

  Widget _getEditProfile() {
    return Text(StringConstants.editProfile,
        style: GoogleFonts.baloo2(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: ColorConstants.black.getColor));
  }

  Widget _getEditProfileContainer(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: ColorConstants.smootWhite.getColor,
        borderRadius: BorderRadius.circular(25.0),
      ),
      height: context.sized.dynamicHeight(0.3),
      padding: context.padding.normal,
      child: Column(
        children: [
          _getEditProfile(),
          Padding(padding: context.padding.verticalLow),
          const ChangePhotoCircleAvatar(),
          Padding(padding: context.padding.verticalLow),
          const Column(
            children: [
              UserNameText(),
              UserEmailText(),
            ],
          )
        ],
      ),
    );
  }
}
