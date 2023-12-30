import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:riverpod_architecture/product/constants/color_constants.dart';
import 'package:riverpod_architecture/product/utility/firebase/firebase_user.dart';

class UserNameText extends StatelessWidget {
  const UserNameText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      FirebaseUser.instance.userData != null
          ? FirebaseUser.instance.userData!.name ?? ""
          : "",
      style: GoogleFonts.baloo2(
        color: ColorConstants.black.getColor,
        fontWeight: FontWeight.w500,
        fontSize: 14,
      ),
    );
  }
}
