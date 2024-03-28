import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_architecture/core/view/base_view.dart';
import 'package:riverpod_architecture/feature/od/od_provider.dart';
import 'package:riverpod_architecture/generated/locale_keys.g.dart';
import 'package:riverpod_architecture/product/package/odViewer/odViewer_controller.dart';
import 'package:riverpod_architecture/product/widget/appbars/custom_app_bar.dart';

// tamamlanıcak

class OdView extends StatelessWidget {
  const OdView({Key? key, required this.path}) : super(key: key);

  final String? path;

  @override
  Widget build(BuildContext context) {
    final CustomODController customODController = ODViewerControllerImpl();

    return BaseView<OdNotifier, OdState>(
        onPageBuilder: (BuildContext context, WidgetRef ref) {
      return Scaffold(
        body: path == null
            ? Container()
            : customODController.build(context, path!),
        appBar: CustomAppBar(
            title: LocaleKeys.general_app,
            subTitle: LocaleKeys.od_3d,
            function: () {}),
      );
    });
  }
}
