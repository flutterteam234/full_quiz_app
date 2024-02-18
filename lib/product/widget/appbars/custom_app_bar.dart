import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../generated/locale_keys.g.dart';
import '../../constants/color_constants.dart';
import '../text/locale_text.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key,this.function, this.title, required this.subTitle}) : super(key: key);

  final Function()? function;
  final String? title;
  final String subTitle;


  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      leadingWidth: 100,
      title: Row(
        children: [
          IconButton(
            onPressed: function,
            icon: Icon(
              Icons.keyboard_arrow_left_sharp,
              color: Color(ColorConstants.smootWhite.toRgba),
            ),
            iconSize: 40,
            color: Color(ColorConstants.black.toRgba),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LocaleText(
                text: title == null ? LocaleKeys.general_app : title!,
                textStyle: GoogleFonts.baloo2(
                  fontWeight: FontWeight.w500,
                  wordSpacing: 1,
                  fontSize: 17,
                  color: ColorConstants.lightSilver.getColor,
                ),
              ),
              LocaleText(
                text: subTitle,
                textStyle: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.5,
                  color: ColorConstants.smootWhite.getColor,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}