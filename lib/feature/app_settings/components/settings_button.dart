import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';
import '../../../product/constants/color_constants.dart';

class SettingsButton extends StatelessWidget {
  const SettingsButton({Key? key, this.function, required this.title, required this.icon})
      : super(key: key);

  final void Function()? function;
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Container(
        padding: context.padding.medium,
        alignment: Alignment.center,
        height: context.sized.dynamicHeight(0.125),
        decoration: BoxDecoration(
            color: ColorConstants.smootWhite.getColor,
            borderRadius: BorderRadius.circular(25.0)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(icon,
                color: ColorConstants.black.getColor,
                size: context.sized.mediumValue),
            Padding(padding: context.padding.horizontalNormal),
            Text(
              title,
              style: GoogleFonts.baloo2(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: ColorConstants.black.getColor),
            )
          ],
        ),
      ),
    );
  }
}
