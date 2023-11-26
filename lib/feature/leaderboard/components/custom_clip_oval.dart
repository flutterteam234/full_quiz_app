import 'package:flutter/material.dart';
import 'package:riverpod_architecture/product/constants/color_constants.dart';
import 'package:kartal/kartal.dart';

class CustomClipOval extends StatelessWidget {
  const CustomClipOval({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ClipPath(
      clipper: _OvalTopBorderClipper(),
      child: Container(
        height: context.sized.dynamicHeight(0.5),
        color: Color(ColorConstants.smootWhite.toRgba),
      ),
    );
  }
}

class _OvalTopBorderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();
    path.moveTo(0, size.height);
    path.lineTo(0, 50);
    path.quadraticBezierTo(size.width / 2, 0, size.width, 50);
    path.lineTo(size.width, size.height);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
