import 'package:flutter/material.dart';
import 'package:o3d/o3d.dart';
import 'package:riverpod_architecture/product/package/odViewer/odViewer.dart';
import 'package:riverpod_architecture/product/utility/extentions/string_extentions.dart';

abstract class CustomODController {
  Widget build(BuildContext context, String path);
}

class ODViewerControllerImpl implements CustomODController {
  final O3DController _o3dController = O3DController();

  @override
  Widget build(BuildContext context, String path) {
    if (path.isGlbFile()) {
      return ODView(
        path: path,
        controller: _o3dController,
      );
    } else {
      return const SizedBox();
    }
  }
}
