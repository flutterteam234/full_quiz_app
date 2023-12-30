import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../product/constants/color_constants.dart';
import '../functions/list_functions.dart';
import '../model/user_total_content.dart';

class TotalPointRichText extends StatelessWidget {
  const TotalPointRichText({Key? key, this.allUserContent, this.index})
      : super(key: key);

  final List<UserTotalContent?>? allUserContent;
  final int? index;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: allUserContent == null
            ? "Err"
            : "${getTotalPoint(allUserContent!, index == null ? 0 : index!)}",
        style: GoogleFonts.baloo2(
          color: ColorConstants.black.getColor,
          fontWeight: FontWeight.w500,
          fontSize: 12,
        ),
        children: [
          TextSpan(
            text: " pts",
            style:
                TextStyle(color: ColorConstants.black.getColor, fontSize: 10),
          ),
        ],
      ),
    );
  }
}
