import 'package:flutter/material.dart';
import 'package:riverpod_architecture/feature/leaderboard/leaderboard_provider.dart';
import 'package:riverpod_architecture/product/constants/color_constants.dart';
import 'package:riverpod_architecture/product/utility/extentions/string_extentions.dart';

import '../../../product/utility/extentions/color_extentions.dart';

class CustomCircleAvatarLeaderboard extends StatelessWidget {
  const CustomCircleAvatarLeaderboard(
      {Key? key, required this.state, required this.index, this.radius})
      : super(key: key);

  final LeaderboardState state;
  final int index;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius ?? 20.0,
      backgroundColor: state.allUserTotalContents![index]?.photoURL != ''
          ? Colors.black
          : ColorUtils.getRandomColor(),
      backgroundImage: state.allUserTotalContents![index]?.photoURL != ''
          ? NetworkImage(state.allUserTotalContents![index]!.photoURL!)
          : null,
      child: state.allUserTotalContents![index]?.photoURL == ''
          ? Text(
              state.allUserTotalContents![index]!.userName.getInitials(),
              style: TextStyle(
                color: ColorConstants.white.getColor,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            )
          : null,
    );
  }
}
