import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:riverpod_architecture/product/package/odViewer/odViewer.dart';
import 'package:o3d/o3d.dart';

import '../../services/device_info/device_info.dart';

mixin ODViewMixin on State<ODView> {
  late final O3DController _o3dController;
  late final PackageInfo _deviceInfo;

  O3DController get o3dController => _o3dController;
  PackageInfo get deviceInfo => _deviceInfo;

  @override
  void initState() {
    super.initState();
    DeviceInfo.instance.setup();
    _deviceInfo = DeviceInfo.instance.packageInfo;
    _o3dController = O3DController();
  }

  @override
  void dispose() {
    super.dispose();
  }


}
