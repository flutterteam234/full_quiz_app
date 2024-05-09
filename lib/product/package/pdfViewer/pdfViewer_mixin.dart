import 'package:flutter_cache_manager/file.dart';
import 'package:riverpod_architecture/product/package/flutter_cache_manager/core/flutter_cache_manager.dart';
import 'package:riverpod_architecture/product/package/pdfViewer/pdfViewer.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

mixin PDFViewMixin on State<PDFView> {
  late final PdfViewerController _pdfViewerController;
  late File? cacheFile;

  final FlutterCacheManager _flutterCacheManager = FlutterCacheManager();

  PdfViewerController get pdfViewerController => _pdfViewerController;

  FlutterCacheManager get flutterCacheManager => _flutterCacheManager;

  @override
  void initState() {
    super.initState();
    _pdfViewerController = PdfViewerController();
    _flutterCacheManager.init();
  }

  @override
  void dispose() {
    _pdfViewerController.dispose();
    super.dispose();
  }
}
