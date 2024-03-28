import 'package:flutter/material.dart';
import 'package:o3d/o3d.dart';
import 'package:riverpod_architecture/product/package/odViewer/odViewer_mixin.dart';

class ODView extends StatefulWidget {
  const ODView({Key? key, required this.path, required this.controller})
      : super(key: key);
  final String path;
  final O3DController controller;

  @override
  State<ODView> createState() => _ODViewState();
}

class _ODViewState extends State<ODView> with ODViewMixin {
  @override
  Widget build(BuildContext context) {
    return O3D.asset(
      src: widget.path,
      controller: widget.controller,
    );
  }
}
