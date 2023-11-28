import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_architecture/feature/leaderboard/components/user_box.dart';
import 'package:riverpod_architecture/feature/leaderboard/functions/list_functions.dart';
import 'package:riverpod_architecture/feature/leaderboard/leaderboard_provider.dart';
import 'package:riverpod_architecture/product/constants/color_constants.dart';
import 'package:kartal/kartal.dart';

class CustomClipOval extends StatelessWidget {
  const CustomClipOval({Key? key, required this.ref, required this.state})
      : super(key: key);

  final WidgetRef ref;
  final LeaderboardState state;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: _OvalTopBorderClipper(),
      child: Container(
          alignment: Alignment.center,
          width: context.sized.dynamicWidth(1),
          height: context.sized.dynamicHeight(0.6),
          color: Color(ColorConstants.smootWhite.toRgba),
          child: ListView(
            padding: context.padding.normal,
            children: [
              Padding(padding: context.padding.onlyTopMedium),
              ListView.builder(
                itemCount: removeFirstThreeElements(state.allUserTotalContents!)
                    .length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      const UserBox(),
                      Padding(padding: context.padding.verticalLow),
                    ],
                  );
                },
              ),
            ],
          )),
    );
  }
}

class _OvalTopBorderClipper extends CustomClipper<Path> {
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
