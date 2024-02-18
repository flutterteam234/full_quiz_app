import 'package:package_info_plus/package_info_plus.dart';

class DeviceInfo {
  DeviceInfo._();

  static DeviceInfo instance = DeviceInfo._();

  Future<void> setup() async {
    deviceInfo = await PackageInfo.fromPlatform();
  }

  late PackageInfo deviceInfo;

}
