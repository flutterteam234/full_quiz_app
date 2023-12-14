import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_architecture/core/view/base_view.dart';
import 'package:kartal/kartal.dart';
import 'package:riverpod_architecture/feature/home/home_provider.dart';
import 'package:riverpod_architecture/product/constants/color_constants.dart';
import 'package:shaped_bottom_bar/models/shaped_item_object.dart';
import 'package:shaped_bottom_bar/shaped_bottom_bar.dart';
import 'package:shaped_bottom_bar/utils/arrays.dart';
import 'package:shaped_bottom_bar/widgets/shaped_bottom_bar_item.dart';
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
    return ShapedBottomBar(
      backgroundColor: Colors.black12,
      iconsColor: Colors.black,
      listItems: [
        ShapedItemObject(iconData: Icons.add, title: "Home"),
        ShapedItemObject(iconData: Icons.quiz, title: "Quiz"),
        ShapedItemObject(iconData: Icons.details, title: "Details"),
        ShapedItemObject(iconData: Icons.leaderboard, title: "Leaderboard"),
      ],
      onItemChanged: (position) {
        state.pageIndex;
      },
      shape: ShapeType.SQUARE,
      shapeColor: ColorConstants.smootGreen.getColor,
      selectedIconColor: Colors.white,
      animationType: ANIMATION_TYPE.FADE,
    );
  }
}

/*FlashyTabBar(
      iconSize: 22.0,
      onItemSelected: (int index) {
        ref.read(provider.notifier).changePage(index);
      },
      items: [
        FlashyTabBarItem(
          icon: const Icon(Icons.add),
          title: const Text('Home'),
        ),
        FlashyTabBarItem(
          icon: const Icon(Icons.quiz),
          title: const Text('Quiz'),
        ),
        FlashyTabBarItem(
          icon: const Icon(Icons.details),
          title: const Text('Details'),
        ),
        FlashyTabBarItem(
          icon: const Icon(Icons.leaderboard),
          title: const Text('Leaderboard'),
        ),
      ],
      selectedIndex: state.pageIndex,
    );*/