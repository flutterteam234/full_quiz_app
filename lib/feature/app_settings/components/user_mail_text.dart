import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:riverpod_architecture/product/constants/color_constants.dart';

class UserEmailText extends StatelessWidget {
  const UserEmailText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    return Text(
      user != null ? user.email ?? "" : "",
      style: GoogleFonts.baloo2(
        color: ColorConstants.black.getColor.withOpacity(0.7),
        fontWeight: FontWeight.w500,
        fontSize: 12,
      ),
    );
  }
}
