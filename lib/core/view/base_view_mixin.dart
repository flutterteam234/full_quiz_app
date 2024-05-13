import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_architecture/core/view/base_view.dart';
import 'package:riverpod_architecture/core/view/base_view_controller.dart';

import '../../product/services/ConnectionChange/network_change_manager.dart';

mixin BaseViewMixin<T extends StateNotifier<U>, U>
    on ConsumerState<BaseView<T, U>> {
  late ConnectionChangeLogger connectionChangeLogger;
  final BaseViewController _baseViewController = BaseViewController();

  BaseViewController get baseViewController => _baseViewController;

  late Timer userAuthTimer;
  late Timer connectionCheckTimer;

}
