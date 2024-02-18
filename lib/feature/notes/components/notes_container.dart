import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';
import 'package:riverpod_architecture/product/constants/image_constants.dart';
import '../../../product/constants/color_constants.dart';

class NotesContainer extends StatelessWidget {
  const NotesContainer(
      {Key? key,
      required this.backgroundImagePath,
      required this.title,
      required this.function})
      : super(key: key);

  final String? backgroundImagePath;
  final String? title;
  final Function()? function;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Container(
        height: context.sized.dynamicHeight(0.2),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: _getImageProvider(),
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
              title != null ? title! : "",
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

  ImageProvider<Object> _getImageProvider() {
    if (backgroundImagePath != null) {
      return NetworkImage(backgroundImagePath!);
    } else {
      return AssetImage(ImageConstants.warning.toImage);
    }
  }
}
