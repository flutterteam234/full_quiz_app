import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
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
    User? user = FirebaseAuth.instance.currentUser;

    return user != null
        ? InkWell(
            onTap: function,
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                CircleAvatar(
                    radius: radius ?? context.sized.mediumValue,
                    backgroundColor:
                    user.photoURL != null
                            ? Colors.black
                            : ColorUtils.getRandomColor(),
                    backgroundImage: _getProfilePhoto(user,photoFromGallery),
                    child: Text(
                      _getBackgroundText(user,photoFromGallery),
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

  ImageProvider? _getProfilePhoto(User? user,File? photoFromGallery) {
    if (photoFromGallery != null) {
      return FileImage(photoFromGallery);
    } else {
      if (user!.photoURL != null) {
        NetworkImage(user.photoURL!);
      } else {
        null;
      }
    }
    return null;
  }

  String _getBackgroundText(User? user,File? photoFromGallery) {
    if (photoFromGallery != null) {
      return "";
    } else {
      if (user!.photoURL == null) {
        return user.displayName.getInitials();
      } else {
        return "";
      }
    }
  }
}
