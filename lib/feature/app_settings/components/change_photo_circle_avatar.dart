import 'dart:io';
import 'package:flutter/material.dart';
import 'package:riverpod_architecture/product/constants/color_constants.dart';
import 'package:riverpod_architecture/product/utility/extentions/string_extentions.dart';
import 'package:riverpod_architecture/product/utility/firebase/firebase_user.dart';
import 'package:kartal/kartal.dart';
import '../../../product/utility/extentions/color_extentions.dart';

class ChangePhotoCircleAvatar extends StatelessWidget {
  const ChangePhotoCircleAvatar(
      {Key? key, this.function, this.radius, this.photoFromGallery})
      : super(key: key);

  final void Function()? function;
  final double? radius;
  final File? photoFromGallery;

  @override
  Widget build(BuildContext context) {
    return FirebaseUser.instance.userData != null
        ? InkWell(
            onTap: function,
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                CircleAvatar(
                    radius: radius ?? context.sized.mediumValue,
                    backgroundColor:
                        FirebaseUser.instance.userData!.photoURL != null
                            ? Colors.black
                            : ColorUtils.getRandomColor(),
                    backgroundImage: _getProfilePhoto(photoFromGallery),
                    child: Text(
                      _getBackgroundText(photoFromGallery),
                      style: TextStyle(
                        color: ColorConstants.white.getColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    )),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(4.0),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: ColorConstants.black.getColor),
                    child: Icon(
                      Icons.edit,
                      color: ColorConstants.smootWhite.getColor,
                      size: context.sized.normalValue,
                    ),
                  ),
                ),
              ],
            ),
          )
        : CircleAvatar(
            radius: radius ?? context.sized.mediumValue,
          );
  }

  ImageProvider? _getProfilePhoto(File? photoFromGallery) {
    if (photoFromGallery != null) {
      return FileImage(photoFromGallery);
    } else {
      if (FirebaseUser.instance.userData!.photoURL != null) {
        NetworkImage(FirebaseUser.instance.userData!.photoURL!);
      } else {
        null;
      }
    }
    return null;
  }

  String _getBackgroundText(File? photoFromGallery) {
    if (photoFromGallery != null) {
      return "";
    } else {
      if (FirebaseUser.instance.userData!.photoURL == null) {
        return FirebaseUser.instance.userData!.name.getInitials();
      } else {
        return "";
      }
    }
  }
}
