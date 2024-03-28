import 'dart:io';

import 'package:package_info_plus/package_info_plus.dart';
import 'package:device_info_plus/device_info_plus.dart';

class DeviceInfo {
  DeviceInfo._();

  static DeviceInfo instance = DeviceInfo._();

  Future<void> setup() async {
    packageInfo = await PackageInfo.fromPlatform();
    deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      androidDeviceInfo = await deviceInfo.androidInfo;
      deviceName = androidDeviceInfo.device;
    } else if (Platform.isIOS) {
      iosDeviceInfo = await deviceInfo.iosInfo;
      deviceName = iosDeviceInfo.name;
    }
  }

  late PackageInfo packageInfo;
  late DeviceInfoPlugin deviceInfo;
  late AndroidDeviceInfo androidDeviceInfo;
  late IosDeviceInfo iosDeviceInfo;
  late String? deviceName;
}
