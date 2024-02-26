import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../product/services/ConnectionChange/connection_change_provider.dart';
import '../../product/services/ConnectionChange/network_change_manager.dart';

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
    extends ConsumerState<BaseView<T, U>> with ConnectionChangeLoggerMixin {
  late ConnectionChangeLogger _connectionChangeLogger;

  @override
  ConnectionChangeLogger get connectionChangeLogger => _connectionChangeLogger;

  @override
  void initState() {
    super.initState();

    _connectionChangeLogger = ref.read(connectionChangeLoggerProvider);

    if (widget.onInitState != null) widget.onInitState!(ref);
  }

  @override
  void dispose() {
    if (widget.onDispose != null) widget.onDispose!();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.onPageBuilder(context, ref);
  }
}
