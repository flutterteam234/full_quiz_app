import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';
import 'package:riverpod_architecture/core/view/base_view.dart';
import 'package:riverpod_architecture/feature/top_picks/components/custom_circle_avatar_top_picks.dart';
import 'package:riverpod_architecture/feature/top_picks/components/top_pick_container.dart';
import 'package:riverpod_architecture/generated/locale_keys.g.dart';
import 'package:riverpod_architecture/product/navigation/enum/router_items.dart';
import 'package:riverpod_architecture/product/navigation/router.dart';
import 'package:riverpod_architecture/product/utility/firebase/firebase_user.dart';
import 'package:riverpod_architecture/product/widget/search_delegate/base_delegate_model.dart';
import 'package:riverpod_architecture/product/widget/search_delegate/search_delegate.dart';
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

    return BaseView(onPageBuilder: (BuildContext context, WidgetRef ref) {
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
    });
  }
}

class _TopPicksContainers extends StatelessWidget {
  const _TopPicksContainers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Column(
        children: [
          TopPickContainer(
              backgroundImage: AssetImage(ImageConstants.homePageTop1.toImage),
              title: LocaleKeys.quiz_quiz,
              navigatePage: RouterItems.quizMain),
          Padding(padding: context.padding.onlyTopNormal),
          TopPickContainer(
              backgroundImage: AssetImage(ImageConstants.homePageTop2.toImage),
              title: LocaleKeys.appNotes_notes,
              navigatePage: RouterItems.appNotes),
        ],
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
              StringConstants.topPicks,
              style: GoogleFonts.baloo2(
                fontWeight: FontWeight.w600,
                fontSize: 20,
                color: ColorConstants.smootWhite.getColor,
              ),
            ),
            Text(
              StringConstants.exploreProgrames,
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
  _CustomField(this._controller);

  final TextEditingController _controller;

  final List<DelegateModel> _items = [
    DelegateModel(
        text: LocaleKeys.quiz_quiz, routerItems: RouterItems.quizMain),
    DelegateModel(
        text: LocaleKeys.appNotes_notes, routerItems: RouterItems.appNotes),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextField(
      controller: _controller,
      onTap: () async {

        Navigator.push(context, RouterItems.odView.goScreen(path: "assets/models/Astronaut.glb"));

        /*
        final response = await showSearch<DelegateModel?>(
          context: context,
          delegate: CustomSearchDelegate(items: items),
        );

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
                text: StringConstants.topPicksWelcome,
                color: ColorConstants.smootWhite.getColor,
                fontWeight: FontWeight.w600,
                fontSize: 18.0),
            FirebaseUser.instance.userData != null
                ? Padding(
                    padding: context.padding.onlyTopLow,
                    child: SubTitleText(
                      text: FirebaseUser.instance.userData!.name ?? '',
                      color: ColorConstants.smootWhite.getColor,
                      fontSize: 22.0,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                : const SizedBox(),
          ],
        ),
        CustomCircleAvatarTopPicks(
          userData: FirebaseUser.instance.userData,
        )
      ],
    );
  }
}

