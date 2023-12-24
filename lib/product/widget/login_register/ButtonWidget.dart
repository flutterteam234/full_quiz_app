import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:riverpod_architecture/product/constants/color_constants.dart';
import 'package:kartal/kartal.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
        ),
        color: ColorConstants.smootGreen.getColor,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: context.sized.mediumValue),
          child: Center(
            child: Text(
              text,
              style: GoogleFonts.baloo2(
                color: ColorConstants.black.getColor,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
