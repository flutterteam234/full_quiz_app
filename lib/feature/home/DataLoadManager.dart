class DataLoadManager {
  static final DataLoadManager _instance = DataLoadManager._internal();

  factory DataLoadManager() {
    return _instance;
  }

  DataLoadManager._internal();

  bool _dataLoaded = false;

  bool get isDataLoaded => _dataLoaded;

  void markDataAsLoaded() {
    _dataLoaded = true;
  }

  void resetDataLoaded() {
    _dataLoaded = false;
  }
}