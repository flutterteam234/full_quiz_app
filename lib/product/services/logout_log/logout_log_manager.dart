import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_architecture/product/models/userData.dart';
import 'package:riverpod_architecture/product/services/logout_log/logout_log_model.dart';
import 'package:riverpod_architecture/product/utility/firebase/firebase_user.dart';
import 'package:riverpod_architecture/product/utility/firebase/firebase_utility.dart';

import '../../utility/extentions/time_extentions.dart';
import '../../utility/firebase/firebase_auth.dart';
import '../../utility/firebase/firebase_collections.dart';
import '../device_info/device_info.dart';

enum LogOutManager {
  save,
  delete,
  logout,
}

extension LogOutManagerExtension on LogOutManager {
  Future<void> init(
      {String? id, bool? status, String? ip, String? mail}) async {
    switch (this) {
      case LogOutManager.save:
        await LogOutOperations().saveLog(ip: ip, status: status);
        break;
      case LogOutManager.logout:
        await LogOutOperations().logout(ip: ip);
        break;
      case LogOutManager.delete:
        break;
    }
  }
}

class LogOutOperations with FirebaseUtility {
  Future<void> saveLog({bool? status, String? ip}) async {
    String? device = DeviceInfo.instance.deviceName;
    Timestamp time = DateTimeExtensions.currentTimestamp();
    UserData? userData = FirebaseUser.instance.userData;
    LogOutModel logOutModel = LogOutModel(
      id: userData?.id,
      status: status,
      device: device,
      ip: ip,
      time: time,
      mail: userData?.email,
    );
    final response =
        await addDocument(logOutModel, FirebaseCollections.logoutLog.reference);
  }

  Future<bool> logout({String? ip}) async {
    bool status = false;

    try {
      await AuthService().signOut();
      status = true;
      await LogOutManager.save.init(status: status, ip: ip);
    } catch (e) {
      status = false;
    }

    return status;
  }
}
