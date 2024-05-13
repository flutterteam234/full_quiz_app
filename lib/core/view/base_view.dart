import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_architecture/core/view/base_view_mixin.dart';
import 'package:riverpod_architecture/product/services/ConnectionChange/connection_change_provider.dart';

class BaseView<T extends StateNotifier<U>, U> extends ConsumerStatefulWidget {
  const BaseView({
    Key? key,
    required this.onPageBuilder,
    this.onInitState,
    this.onDispose,
  }) : super(key: key);

  final Widget Function(BuildContext context, WidgetRef ref) onPageBuilder;
  final void Function(WidgetRef ref)? onInitState;
  final VoidCallback? onDispose;


  @override
  ConsumerState createState() => _BaseViewState<T, U>();
}

class _BaseViewState<T extends StateNotifier<U>, U>
    extends ConsumerState<BaseView<T, U>> with BaseViewMixin {


  @override
  void initState() {
    super.initState();

    connectionChangeLogger = ref.read(connectionChangeLoggerProvider);

    userAuthTimer = Timer.periodic(const Duration(minutes: 1), (timer) {
      baseViewController.checkUserAuth(context);
    });

    connectionCheckTimer = Timer.periodic(const Duration(seconds: 10), (timer) {
      baseViewController.checkConnection(
          context, connectionChangeLogger.getCurrentNetworkStatus());
    });


    if (widget.onInitState != null) widget.onInitState!(ref);
  }

  @override
  void dispose() {
    userAuthTimer.cancel();
    connectionCheckTimer.cancel();

    if (widget.onDispose != null) widget.onDispose!();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.onPageBuilder(context, ref);
  }
}
