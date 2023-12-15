import 'package:flutter/material.dart';
import 'package:riverpod_architecture/product/constants/color_constants.dart';

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
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color: ColorConstants.black.getColor,
        child: Padding(
          padding: const EdgeInsets.only(top: 23, bottom: 23),
          child: Center(
            child: Text(
              text,
              style:
                  TextStyle(color: ColorConstants.white.getColor, fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }
}
