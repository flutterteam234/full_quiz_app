import 'package:flutter/material.dart';
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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(),

            ClipPath(
              clipper: OvalTopBorderClipper(),
              child: Container(
                height: context.sized.dynamicHeight(0.5),
                color: Colors.blue,
              ),
            ),
          ],
        ),
      );
    });
  }
}

class OvalTopBorderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();
    path.moveTo(0, size.height);
    path.lineTo(0, 50);
    path.quadraticBezierTo(size.width / 2, 0, size.width, 50);
    path.lineTo(size.width, size.height);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
