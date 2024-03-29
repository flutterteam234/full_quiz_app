import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';
import 'package:riverpod_architecture/feature/leaderboard/functions/list_functions.dart';
import 'package:riverpod_architecture/feature/leaderboard/leaderboard_provider.dart';
import 'package:riverpod_architecture/product/constants/color_constants.dart';

import 'custom_circle_avatar_leaderboard.dart';

class UserBox extends StatelessWidget {
  const UserBox(
      {Key? key, required this.ref, required this.state, required this.index})
      : super(key: key);

  final WidgetRef ref;
  final LeaderboardState state;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: context.sized.dynamicWidth(1),
      height: context.sized.highValue,
      decoration: BoxDecoration(
        color: Color(ColorConstants.white.toRgba),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Padding(
                padding: context.padding.onlyLeftLow,
                child: Text(
                  '${index + 1}',
                  style: GoogleFonts.baloo2(
                      fontWeight: FontWeight.w500, fontSize: 18),
                ),
              ),
              Padding(
                padding: context.padding.low,
                child: CustomCircleAvatarLeaderboard(state: state, index: index),
              ),
              Padding(
                padding: context.padding.onlyRightLow,
                child: Text(
                  state.allUserTotalContents![index]!.userName!,
                  style: GoogleFonts.baloo2(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: context.padding.onlyRightLow,
            child: RichText(
              text: TextSpan(
                text: "${getTotalPoint(state.allUserTotalContents!, index)} ",
                style: GoogleFonts.baloo2(
                  color: ColorConstants.black.getColor,
                  fontWeight: FontWeight.w500,
                  wordSpacing: 1,
                  fontSize: 17,
                ),
                children: [
                  TextSpan(
                    text: "pts",
                    style: TextStyle(
                        color: ColorConstants.black.getColor, fontSize: 13),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
