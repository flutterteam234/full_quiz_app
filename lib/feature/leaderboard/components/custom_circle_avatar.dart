import 'package:flutter/material.dart';
import 'package:riverpod_architecture/feature/leaderboard/leaderboard_provider.dart';
import 'package:riverpod_architecture/product/constants/color_constants.dart';

import '../../../product/utility/extentions/color_extentions.dart';

class CustomCircleAvatar extends StatelessWidget {
  const CustomCircleAvatar(
      {Key? key, required this.state, required this.index, this.radius})
      : super(key: key);

  final LeaderboardState state;
  final int index;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius ?? 20.0,
      backgroundColor: state.allUserTotalContents![index]?.profilUrl != ''
          ? Colors.black
          : ColorUtils.getRandomColor(),
      backgroundImage: state.allUserTotalContents![index]?.profilUrl != ''
          ? NetworkImage(state.allUserTotalContents![index]!.profilUrl!)
          : null,
      child: state.allUserTotalContents![index]?.profilUrl == ''
          ? Text(
              getInitials(state.allUserTotalContents![index]?.userName ?? ''),
              style: TextStyle(
                color: ColorConstants.white.getColor,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            )
          : null,
    );
  }

  String getInitials(String name) {
    List<String> nameParts = name.split(" ");
    String initials = "";
    for (var part in nameParts) {
      if (part.isNotEmpty) {
        initials += part[0].toUpperCase();
      }
    }
    return initials;
  }
}