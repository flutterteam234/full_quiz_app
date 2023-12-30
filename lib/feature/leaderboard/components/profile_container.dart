import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';
import 'package:riverpod_architecture/feature/leaderboard/components/total_point_richText.dart';
import 'package:riverpod_architecture/product/models/userData.dart';
import 'package:riverpod_architecture/product/utility/firebase/firebase_user.dart';

import '../../../product/constants/color_constants.dart';
import '../leaderboard_provider.dart';
import 'custom_circle_avatar_leaderboard.dart';

class ProfileContainer extends StatelessWidget {
  const ProfileContainer({Key? key, required this.state, required this.index})
      : super(key: key);

  final LeaderboardState state;
  final int index;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 100,
        child: Column(
          children: [
            Container(
                decoration: BoxDecoration(
                  color: Color(ColorConstants.smootWhite.toRgba),
                  shape: BoxShape.circle,
                ),
                child: CustomCircleAvatarLeaderboard(
                  state: state,
                  index: index,
                  radius: 30.0,
                )),
            Padding(
              padding: context.padding.horizontalLow,
            ),
            Text(getUsername(state),
                style: GoogleFonts.baloo2(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: Color(ColorConstants.darkGreen.toRgba),
                )),
            TotalPointRichText(
              allUserContent: state.allUserTotalContents,
              index: index,
            )
          ],
        ));

  }
  String getUsername(LeaderboardState state){
    UserData? firebaseUser = FirebaseUser.instance.userData;
    if(firebaseUser != null){
      if(firebaseUser.id == state.allUserTotalContents![index]!.id){
        return "You";
      }else{
        return state.allUserTotalContents![index]!.userName.toString();
      }
    }else{
      return state.allUserTotalContents![index]!.userName.toString();
    }

  }
}

