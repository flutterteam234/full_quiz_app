import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_architecture/product/constants/color_constants.dart';
import 'package:riverpod_architecture/product/navigation/enum/router_items.dart';
import 'package:riverpod_architecture/product/navigation/router.dart';
import '../../../product/utility/extentions/color_extentions.dart';

class CustomCircleAvatarTopPicks extends StatelessWidget {
  const CustomCircleAvatarTopPicks({Key? key, this.radius})
      : super(key: key);

  final double? radius;

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    return user == null
        ? const CircleAvatar(
            radius: 20.0,
          )
        : InkWell(
            onTap: () {
              Navigator.push(context, RouterItems.appSettings.goScreen());
            },
            child: CircleAvatar(
              radius: radius ?? 20.0,
              backgroundColor: user.photoURL != null
                  ? Colors.black
                  : ColorUtils.getRandomColor(),
              backgroundImage: user.photoURL != null
                  ? NetworkImage(user.photoURL!)
                  : null,
              child: user.photoURL == null
                  ? Text(
                      getInitials(user.displayName ?? ''),
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
