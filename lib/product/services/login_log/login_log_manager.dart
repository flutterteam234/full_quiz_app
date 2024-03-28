import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_architecture/product/services/device_info/device_info.dart';
import 'package:riverpod_architecture/product/services/login_log/login_log_model.dart';
import 'package:riverpod_architecture/product/utility/firebase/firebase_collections.dart';
import 'package:riverpod_architecture/product/utility/firebase/firebase_utility.dart';

import '../../utility/extentions/time_extentions.dart';

enum LoginLogManager {
  save,
  delete;
}

extension LoginLogManagerExtention on LoginLogManager {
  Future<void> init(
      {required String? id,
      String? method,
      required bool status,
      String? ip,
      String? mail}) async {
    switch (this) {
      case LoginLogManager.save:
        await LoginLogOperations().saveLog(id, method, status, ip, mail);
        break;
      case LoginLogManager.delete:
        break;
    }
  }
}

class LoginLogOperations with FirebaseUtility {
  Future<void> saveLog(
      String? id, String? method, bool status, String? ip, String? mail) async {
    String? device = DeviceInfo.instance.deviceName;
    Timestamp time = DateTimeExtensions.currentTimestamp();
    LoginLogModel loginLogModel = LoginLogModel(
      id: id,
      status: status,
      device: device,
      ip: ip,
      method: method,
      time: time,
      mail: mail,
    );
    final response = await addDocument(
        loginLogModel, FirebaseCollections.loginLog.reference);
  }
}
