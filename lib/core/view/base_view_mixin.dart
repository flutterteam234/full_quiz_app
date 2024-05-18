import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_architecture/core/view/base_view.dart';
import 'package:riverpod_architecture/core/view/base_view_controller.dart';
import 'package:riverpod_architecture/product/services/ConnectionChange/connection_change_enum.dart';

import '../../product/services/ConnectionChange/network_change_manager.dart';

mixin BaseViewMixin<T extends StateNotifier<U>, U>
    on ConsumerState<BaseView<T, U>> {
  late ConnectionChangeLogger connectionChangeLogger;
  final BaseViewController _baseViewController = BaseViewController();

  BaseViewController get baseViewController => _baseViewController;

  late Timer userAuthTimer;
  late Timer connectionCheckTimer;

  NetworkResult _networkResult = NetworkResult.on;
  NetworkResult get networkResult => _networkResult;

  void changeNetworkResult(NetworkResult networkResult) {
    switch (networkResult) {
      case NetworkResult.on:
        _networkResult = NetworkResult.on;
        break;
      case NetworkResult.off:
        _networkResult = NetworkResult.off;
        break;
    }
    setState(() {
      _networkResult;
    });
  }
}
