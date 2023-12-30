import 'package:flutter/material.dart';
import 'package:riverpod_architecture/product/constants/color_constants.dart';
import 'package:riverpod_architecture/product/models/userData.dart';
import 'package:riverpod_architecture/product/navigation/enum/router_items.dart';
import 'package:riverpod_architecture/product/navigation/router.dart';
import '../../../product/utility/extentions/color_extentions.dart';

class CustomCircleAvatarTopPicks extends StatelessWidget {
  const CustomCircleAvatarTopPicks({Key? key, this.userData, this.radius})
      : super(key: key);

  final UserData? userData;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return userData == null
        ? const CircleAvatar(
            radius: 20.0,
          )
        : InkWell(
            onTap: () {
              Navigator.push(context, RouterItems.appSettings.goScreen());
            },
            child: CircleAvatar(
              radius: radius ?? 20.0,
              backgroundColor: userData!.photoURL != null
                  ? Colors.black
                  : ColorUtils.getRandomColor(),
              backgroundImage: userData!.photoURL != null
                  ? NetworkImage(userData!.photoURL!)
                  : null,
              child: userData!.photoURL == null
                  ? Text(
                      getInitials(userData!.name ?? ''),
                      style: TextStyle(
                        color: ColorConstants.white.getColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    )
                  : null,
            ),
          );
  }

  String getInitials(String name) {
    List<String> nameParts = name.split(" ");
    String initials = "";
    for (var part in nameParts) {
      if (part.isNotEmpty) {
        initials += part[0].toUpperCase();
      }
    }
    return initials;
  }
}
