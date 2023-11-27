import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';
import 'package:riverpod_architecture/core/view/base_view.dart';
import 'package:riverpod_architecture/feature/leaderboard/components/custom_clip_oval.dart';
import 'package:riverpod_architecture/feature/leaderboard/leaderboard_provider.dart';
import 'package:riverpod_architecture/product/constants/color_constants.dart';
import 'package:riverpod_architecture/product/constants/string_constants.dart';

class LeaderboardView extends StatelessWidget {
  const LeaderboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final leaderboardProvider =
        StateNotifierProvider<LeaderboardNotifier, LeaderboardState>((ref) {
      return LeaderboardNotifier();
    });

    return BaseView(onPageBuilder: (BuildContext context, WidgetRef ref) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(StringConstants.leaderboard,
              style: GoogleFonts.baloo2(
                  color: Color(ColorConstants.white.toRgba),
                  fontWeight: FontWeight.bold)),
          backgroundColor: Colors.transparent,
          leadingWidth: 100,
          leading: IconButton(
              onPressed: () {
                //ref.read(leaderboardProvider.notifier).previousQuestion();
              },
              icon: Icon(
                Icons.keyboard_arrow_left_sharp,
                color: Color(ColorConstants.white.toRgba),
              ),
              iconSize: 40,
              color: Color(ColorConstants.black.toRgba)),
        ),
        backgroundColor: Color(ColorConstants.smootGreen.toRgba),
        body: const Column(
          children: [
            _TopThreeRow(),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: CustomClipOval(),
              ),
            ),
          ],
        ),
      );
    });
  }
}


class _TopThreeRow extends StatelessWidget {
  const _TopThreeRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.sized.dynamicHeight(0.2),
      width: context.sized.dynamicWidth(1),
      alignment: Alignment.center,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.only(
              bottom: index == 1 ? context.sized.mediumValue : 0,
              left: context.sized.lowValue,
              right: context.sized.lowValue,
            ),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                    color: Color(ColorConstants.darkGreen.toRgba), width: 3),
                shape: BoxShape.circle,
              ),
              child: Icon(size: context.sized.highValue, Icons.person),
            ),
          );
        },
      ),
    );
  }
}
