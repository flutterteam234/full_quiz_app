import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';

import 'package:riverpod_architecture/product/widget/toast_message/connection_change_toast_message.dart';

import 'connection_change_enum.dart';

class NetworkChangeManager {
  late final Connectivity _connectivity;

  NetworkChangeManager() {
    _connectivity = Connectivity();
  }

  Future<NetworkResult> checkNetworkFirstTime() async {
    final connectivityResult = await _connectivity.checkConnectivity();
    return _mapConnectivityResult(connectivityResult);
  }

  void handleNetworkChange(void Function(NetworkResult) onChange) {
    _connectivity.onConnectivityChanged.listen((event) {
      final result = _mapConnectivityResult(event);
      onChange(result);
    });
  }

  NetworkResult _mapConnectivityResult(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.none:
        return NetworkResult.off;
      default:
        return NetworkResult.on;
    }
  }
}

class ConnectionChangeLogger {
  static final ConnectionChangeLogger _instance =
      ConnectionChangeLogger._internal();

  factory ConnectionChangeLogger() => _instance;

  late final NetworkChangeManager _networkChange;
  late NetworkResult _currentNetworkStatus;

  ConnectionChangeLogger._internal() {
    _networkChange = NetworkChangeManager();

    _networkChange.handleNetworkChange((result) {
      /*
      if (result == NetworkResult.on) {
      } else {
      }

       */
      _currentNetworkStatus = result;
    });

    _networkChange.checkNetworkFirstTime().then((result) {
      _logInitialConnection(result);
      _currentNetworkStatus = result;
    });
  }

  void _logInitialConnection(NetworkResult result) {
    if (result == NetworkResult.on) {
      print('Connected to the internet initially');
    } else {
      print('No internet connection initially');
    }
  }

  NetworkResult getCurrentNetworkStatus() {
    return _currentNetworkStatus;
  }
}
