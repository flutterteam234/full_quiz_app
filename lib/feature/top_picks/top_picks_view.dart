import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';
import '../../product/constants/color_constants.dart';
import '../../product/constants/image_constants.dart';
import '../../product/constants/string_constants.dart';
import '../../product/widget/text/sub_title_text.dart';
import '../../product/widget/text/title_text.dart';

class TopPicksView extends StatelessWidget {
  const TopPicksView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();

    return SafeArea(
        child: ListView(
      padding: EdgeInsets.only(
          left: context.sized.normalValue, right: context.sized.normalValue),
      children: [
        const _Header(),
        Padding(padding: context.padding.onlyTopNormal),
        _CustomField(controller),
        Padding(padding: context.padding.onlyTopNormal),
        const _TopPicksRow(),
        Padding(padding: context.padding.onlyTopNormal),
        const _TopPicksContainers()
      ],
    ));
  }
}


class _TopPicksContainers extends StatelessWidget {
  const _TopPicksContainers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 4,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              Container(
                height: context.sized.dynamicHeight(0.2),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(ImageConstants.homePageTop1.toImage),
                    fit: BoxFit.cover,
                  ),
                  color: ColorConstants.smootWhite.getColor,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                padding: context.padding.normal,
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Quiz",
                      style: GoogleFonts.baloo2(
                        color: ColorConstants.smootWhite.getColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: context.sized.normalValue,
                        vertical: context.sized.lowValue,
                      ),
                      decoration: BoxDecoration(
                        color: ColorConstants.white.getColor.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Icon(
                        Icons.arrow_right_alt,
                        color: ColorConstants.white.getColor,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(padding: context.padding.onlyTopLow),
            ],
          );
        },
      ),
    );
  }
}

class _TopPicksRow extends StatelessWidget {
  const _TopPicksRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Top Picks",
              style: GoogleFonts.baloo2(
                fontWeight: FontWeight.w600,
                fontSize: 20,
                color: ColorConstants.smootWhite.getColor,
              ),
            ),
            Text(
              "Let’s explore our programes",
              style: GoogleFonts.baloo2(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: ColorConstants.ligthGrey.getColor,
              ),
            ),
          ],
        ),
        Icon(Icons.notifications_none,
            color: ColorConstants.smootWhite.getColor, size: 30),
      ],
    );
  }
}

class _CustomField extends ConsumerWidget {
  const _CustomField(this.controller);

  final TextEditingController controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextField(
      controller: controller,
      onTap: () async {
        /*
        final response = await showSearch<Tag?>(
          context: context,
          delegate: HomeSearchDelegate(
            ref.read(_homeProvider.notifier).fullTagList,
          ),
        );
        ref.read(_homeProvider.notifier).updateSelectedTag(response);

         */
      },
      decoration: const InputDecoration(
        suffixIcon: Icon(Icons.search, size: 22.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide.none,
        ),
        filled: true,
        //fillColor: ColorConstants.grayLighter,
        hintText: StringConstants.searchYourFavoritePlace,
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleText(
                text: 'Welcome',
                color: ColorConstants.smootWhite.getColor,
                fontWeight: FontWeight.w600,
                fontSize: 18.0),
            Padding(
              padding: context.padding.onlyTopLow,
              child: SubTitleText(
                text: 'Emir Bayraktar',
                color: ColorConstants.smootWhite.getColor,
                fontSize: 22.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        CircleAvatar(backgroundColor: ColorConstants.white.getColor),
      ],
    );
  }
}
