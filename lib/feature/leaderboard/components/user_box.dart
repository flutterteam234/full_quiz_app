import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';
import 'package:riverpod_architecture/product/constants/color_constants.dart';

class UserBox extends StatelessWidget {
  const UserBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: context.sized.dynamicWidth(1),
      height: context.sized.highValue,
      decoration: BoxDecoration(
        color: Color(ColorConstants.white.toRgba),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Padding(
                padding: context.padding.onlyLeftLow,
                child: Text(
                  "1",
                  style: GoogleFonts.baloo2(
                      fontWeight: FontWeight.w500, fontSize: 18),
                ),
              ),
              Padding(
                padding: context.padding.low,
                child: const CircleAvatar(
                  child: Icon(Icons.person),
                ),
              ),
              Padding(
                padding: context.padding.onlyRightLow,
                child: Text(
                  "Emir Bayraktar",
                  style: GoogleFonts.baloo2(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: context.padding.onlyRightLow,
            child: Text(
              "1/10",
              style: GoogleFonts.baloo2(
                fontWeight: FontWeight.w500,
                fontSize: 17,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
