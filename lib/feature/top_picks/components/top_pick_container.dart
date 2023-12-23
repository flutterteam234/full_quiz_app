import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';
import 'package:riverpod_architecture/product/navigation/enum/router_items.dart';
import 'package:riverpod_architecture/product/navigation/router.dart';
import '../../../product/constants/color_constants.dart';


class TopPickContainer extends StatelessWidget {
  const TopPickContainer(
      {Key? key,
      required this.backgroundImage,
      required this.title,
      required this.navigatePage})
      : super(key: key);

  final ImageProvider<Object> backgroundImage;
  final String title;
  final RouterItems navigatePage;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, navigatePage.goScreen());
      },
      child: Container(
        height: context.sized.dynamicHeight(0.2),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: backgroundImage,
            fit: BoxFit.cover,
          ),
          color: ColorConstants.smootWhite.getColor,
          borderRadius: BorderRadius.circular(20.0),
        ),
        padding: context.padding.normal,
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: GoogleFonts.baloo2(
                color: ColorConstants.smootWhite.getColor,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: context.sized.normalValue,
                vertical: context.sized.lowValue,
              ),
              decoration: BoxDecoration(
                color: ColorConstants.white.getColor.withOpacity(0.3),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Icon(
                Icons.arrow_right_alt,
                color: ColorConstants.white.getColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
