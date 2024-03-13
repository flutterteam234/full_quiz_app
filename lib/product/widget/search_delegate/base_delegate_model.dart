import 'package:riverpod_architecture/product/navigation/enum/router_items.dart';

abstract class BaseDelegateModel {
  String get text;
  RouterItems? get routerItems;
}

class DelegateModel implements BaseDelegateModel {
  @override
  final String text;
  @override
  final RouterItems? routerItems;

  DelegateModel({required this.text, this.routerItems});
}