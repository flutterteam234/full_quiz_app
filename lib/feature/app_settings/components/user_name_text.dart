import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:riverpod_architecture/product/constants/color_constants.dart';

class UserNameText extends StatelessWidget {
  const UserNameText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    return Text(
      user != null
          ? user.displayName ?? ""
          : "",
      style: GoogleFonts.baloo2(
        color: ColorConstants.black.getColor,
        fontWeight: FontWeight.w500,
        fontSize: 14,
      ),
    );
  }
}
