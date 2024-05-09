import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:riverpod_architecture/core/view/base_view.dart';
import 'package:kartal/kartal.dart';
import 'package:riverpod_architecture/feature/home/home_provider.dart';
import 'package:riverpod_architecture/product/constants/color_constants.dart';
import 'package:riverpod_architecture/product/constants/string_constants.dart';

import 'enum/page_enum.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeProvider = StateNotifierProvider<HomeNotifier, HomeState>((ref) {
      return HomeNotifier();
    });

    return BaseView(onPageBuilder: (BuildContext context, WidgetRef ref) {
      final homeState = ref.watch(homeProvider);

      // buraya çağır


      PageEnum currentPage = RouterItemsExtension.fromId(homeState.pageIndex);
      Widget selectedPage = (currentPage).page;

      return Scaffold(
        bottomNavigationBar:
            _BottomBar(ref: ref, provider: homeProvider, state: homeState),
        backgroundColor: ColorConstants.smootGreen.getColor,
        body: selectedPage,
      );
    });
  }
}

class _BottomBar extends StatelessWidget {
  const _BottomBar(
      {Key? key,
      required this.ref,
      required this.provider,
      required this.state})
      : super(key: key);

  final WidgetRef ref;
  final StateNotifierProvider<HomeNotifier, HomeState> provider;
  final HomeState state;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: state.pageIndex,
        iconSize: 16,
        unselectedItemColor: ColorConstants.black.getColor,
        selectedItemColor: ColorConstants.smootWhite.getColor,
        backgroundColor: ColorConstants.smootWhite.getColor,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (index) {
          ref.read(provider.notifier).changePage(index);
        },
        items: [

          BottomNavigationBarItem(
              icon: _getBottomBarItem(StringConstants.home, Icons.home_outlined,
                  state.pageIndex == 0, context),
              label: ''),
          BottomNavigationBarItem(
              icon: _getBottomBarItem(StringConstants.quiz, Icons.quiz_outlined,
                  state.pageIndex == 1, context),
              label: ''),
          BottomNavigationBarItem(
              icon: _getBottomBarItem(StringConstants.leaderboard,
                  Icons.leaderboard_outlined, state.pageIndex == 2, context),
              label: ''),
        ]);
  }

  Widget _getBottomBarItem(
      String title, IconData iconData, bool isSelected, BuildContext context) {
    return AnimatedSwitcher(
        duration: const Duration(seconds: 1),
        child: Container(
          key: ValueKey<int>(state.pageIndex),
          padding: context.padding.low,
          width: context.sized.dynamicWidth(0.2),
          decoration: BoxDecoration(
            color: isSelected
                ? ColorConstants.black.getColor
                : ColorConstants.smootWhite.getColor,
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Column(
            children: [
              Icon(
                iconData,
                color: isSelected
                    ? ColorConstants.smootWhite.getColor
                    : ColorConstants.black.getColor,
              ),
              Text(title,
                  style: GoogleFonts.baloo2(
                    fontSize: 12,
                    color: isSelected
                        ? ColorConstants.smootWhite.getColor
                        : ColorConstants.black.getColor,
                  )),
            ],
          ),
        ));
  }
}
