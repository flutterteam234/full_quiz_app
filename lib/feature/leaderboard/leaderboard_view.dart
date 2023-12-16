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

    return BaseView<LeaderboardNotifier, LeaderboardState>(
        onInitState: (WidgetRef ref) {
      ref.read(leaderboardProvider.notifier).loadPointsAndUsers();
    }, onPageBuilder: (BuildContext context, WidgetRef ref) {
      final leaderboardState = ref.watch(leaderboardProvider);

      return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text(StringConstants.leaderboard,
              style: GoogleFonts.baloo2(
                  color: Color(ColorConstants.smootWhite.toRgba),
                  fontWeight: FontWeight.bold)),
          backgroundColor: Colors.transparent,
          leadingWidth: 100,
          leading: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.keyboard_arrow_left_sharp,
                color: Color(ColorConstants.white.toRgba),
              ),
              iconSize: 40,
              color: Color(ColorConstants.black.toRgba)),
        ),
        backgroundColor: Color(ColorConstants.smootGreen.toRgba),
        body: leaderboardState.isLoading
            ? const Center(
                child: LinearProgressIndicator(),
              )
            : Column(
                children: [
                  Padding(padding: context.padding.verticalLow),
                  _TopThreeRow(ref: ref, state: leaderboardState),
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: CustomClipOval(
                        ref: ref,
                        state: leaderboardState,
                      ),
                    ),
                  ),
                ],
              ),
      );
    });
  }
}

class _TopThreeRow extends StatelessWidget {
  const _TopThreeRow({Key? key, required this.ref, required this.state})
      : super(key: key);

  final WidgetRef ref;
  final LeaderboardState state;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: context.sized.dynamicHeight(0.2),
        width: context.sized.dynamicWidth(0.8),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: _buildProfileContainer(
                context,
                getProfilName(0),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: _buildProfileContainer(
                context,
                getProfilName(1),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: _buildProfileContainer(
                context,
                getProfilName(2),
              ),
            )
          ],
        ));
  }

  getProfilePictureAlignment(int index) {
    switch (index) {
      case 0:
        return Alignment.centerLeft;
      case 1:
        return Alignment.center;
      case 2:
        return Alignment.centerRight;
      default:
        return Alignment.center;
    }
  }

  String getProfilName(int index) {
    if (state.allUserTotalContents![index]!.userName == null) {
      return StringConstants.nullUserName;
    } else {
      return state.allUserTotalContents![index]!.userName!;
    }
  }

  Widget _buildProfileContainer(BuildContext context, String text) {
    return SizedBox(
        height: 100,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Color(ColorConstants.smootWhite.toRgba),
                border: Border.all(
                    color: Color(ColorConstants.ligthGreen.toRgba), width: 2),
                shape: BoxShape.circle,
              ),
              child: const Icon(size: 75, Icons.person), // profil resmi eklenicek
            ),
            Padding(
              padding: context.padding.horizontalLow,
            ),
            Text(text,
                style: GoogleFonts.baloo2(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: Color(ColorConstants.darkGreen.toRgba),
                )),
          ],
        ));
  }
}
