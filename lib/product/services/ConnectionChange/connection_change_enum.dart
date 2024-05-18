enum NetworkResult {
  on,
  off,
}

extension NetworkResultExtention on NetworkResult {
    bool _isConnected() {
    switch (this) {
      case NetworkResult.on:
        return true;
      case NetworkResult.off:
        return false;
    }
  }

  bool get getIsConnected => _isConnected();
}


