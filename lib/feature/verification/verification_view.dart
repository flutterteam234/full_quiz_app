import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';
import 'package:riverpod_architecture/core/view/base_view.dart';
import 'package:riverpod_architecture/feature/verification/verification_provider.dart';
import 'package:riverpod_architecture/generated/locale_keys.g.dart';
import 'package:riverpod_architecture/product/constants/color_constants.dart';
import 'package:riverpod_architecture/product/navigation/enum/router_items.dart';
import 'package:riverpod_architecture/product/navigation/router.dart';
import 'package:riverpod_architecture/product/widget/text/locale_text.dart';
import 'package:riverpod_architecture/product/widget/verification/verification.dart';

class VerificationView extends StatelessWidget {
  const VerificationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final verificationProvider =
        StateNotifierProvider<VerificationNotifier, VerificationState>((ref) {
      return VerificationNotifier();
    });

    return BaseView(onPageBuilder: (BuildContext context, WidgetRef ref) {
      final verificationState = ref.watch(verificationProvider);
      final verificationNotifier = ref.read(verificationProvider.notifier);

      return Scaffold(
          backgroundColor: ColorConstants.white.getColor,
          appBar: _getAppBar(context,verificationState),
          body: ListView(
            padding: context.padding.medium,
            children: [
              _getVerificationTexts(context),
              Padding(padding: context.padding.verticalMedium),
              Verification()
            ],
          ));
    });
  }

  PreferredSizeWidget _getAppBar(
      BuildContext context, VerificationState verificationState) {
    return AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: Text(verificationState.verificationSecond.toString()),
        leading: InkWell(
          child: Icon(Icons.arrow_back, color: ColorConstants.black.getColor),
          onTap: () {
            Navigator.push(context, RouterItems.appSettings.goScreen());
          },
        ));
  }

  Widget _getVerificationTexts(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LocaleText(
            text: LocaleKeys.verification_verificationCode,
            textStyle: GoogleFonts.baloo2(
              fontSize: 22,
              fontWeight: FontWeight.w500,
            )),
        Padding(padding: context.padding.verticalLow),
        LocaleText(
            text: LocaleKeys.verification_verificationCodeDetail,
            textStyle: GoogleFonts.poppins(
                fontSize: 16, color: ColorConstants.lightBlack.getColor)),
      ],
    );
  }
}
