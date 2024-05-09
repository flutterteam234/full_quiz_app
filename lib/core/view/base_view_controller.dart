import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:riverpod_architecture/product/constants/exceptions_constants.dart';
import 'package:riverpod_architecture/product/navigation/enum/router_items.dart';
import 'package:riverpod_architecture/product/navigation/router.dart';
import 'package:riverpod_architecture/product/utility/exceptions/custom_exceptions.dart';
import 'package:riverpod_architecture/product/utility/firebase/firebase_auth.dart';

abstract class IBaseViewController {
  void checkConditions(BuildContext context);

  void forceQuit(BuildContext context);
}

class BaseViewController implements IBaseViewController {
  @override
  void checkConditions(BuildContext context) async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      forceQuit(context);
    } else {
      if (user.email == null ||
          user.email == null) {
        forceQuit(context);
        FirebaseCustomExceptions(ExceptionsConstants.authError);
      }
    }
  }

  @override
  void forceQuit(BuildContext context) {
    AuthService().signOut();
    Navigator.pushAndRemoveUntil(context, RouterItems.login.goScreen(), (route) => true);
  }
}
