import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:riverpod_architecture/product/constants/exceptions_constants.dart';
import 'package:riverpod_architecture/product/navigation/enum/router_items.dart';
import 'package:riverpod_architecture/product/navigation/router.dart';
import 'package:riverpod_architecture/product/utility/exceptions/custom_exceptions.dart';
import 'package:riverpod_architecture/product/utility/firebase/firebase_auth.dart';
import 'package:riverpod_architecture/product/widget/show_dialogs/connection_error.dart';

import '../../product/services/ConnectionChange/connection_change_enum.dart';

abstract class IBaseViewController {
  void checkUserAuth(BuildContext context);

  void checkConnection(BuildContext context, NetworkResult networkResult);

  void forceQuit(BuildContext context);
}

class BaseViewController implements IBaseViewController {
  @override
  void checkUserAuth(BuildContext context) async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      forceQuit(context);
    } else {
      if (user.email == null || user.email == null) {
        forceQuit(context);
        FirebaseCustomExceptions(ExceptionsConstants.authError);
      }
    }
  }

  @override
  void checkConnection(BuildContext context, NetworkResult networkResult) {
    if(!context.mounted) return;

    switch (networkResult) {
      case NetworkResult.on:
        break;
      case NetworkResult.off:
        ConnectionError.showNoInternetDialog(context);
        break;
    }
  }

  @override
  void forceQuit(BuildContext context) {
    AuthService().signOut();
    Navigator.pushAndRemoveUntil(
        context, RouterItems.login.goScreen(), (route) => true);
  }
}
