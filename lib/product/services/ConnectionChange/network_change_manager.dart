import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:riverpod_architecture/product/widget/connection_change_toast/connection_change_toast_message.dart';

enum NetworkResult {
  on,
  off,
}

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
  late final NetworkChangeManager _networkChange;

  ConnectionChangeLogger() {
    _networkChange = NetworkChangeManager();

    _networkChange.handleNetworkChange((result) {
      if (result == NetworkResult.on) {
        //ConnectionChangeToastMessage.showToastOn();
      } else {
        ConnectionChangeToastMessage.showToastOff();
      }
    });

    _networkChange.checkNetworkFirstTime().then((result) {
      _logInitialConnection(result);
    });
  }

  void _logInitialConnection(NetworkResult result) {
    if (result == NetworkResult.on) {
      print('Connected to the internet initially');
    } else {
      print('No internet connection initially');
    }
  }
}
