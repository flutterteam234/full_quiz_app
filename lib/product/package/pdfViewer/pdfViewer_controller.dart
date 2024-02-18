import 'package:flutter/material.dart';
import 'package:riverpod_architecture/product/constants/settings_constants.dart';
import 'package:riverpod_architecture/product/package/pdfViewer/pdfViewer.dart';
import 'package:riverpod_architecture/product/utility/extentions/string_extentions.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

abstract class CustomPdfController {
  void nextPage();

  void previousPage();

  void zoomIn();

  void zoomOut();

  void dispose();

  Widget build(BuildContext context, String url);
}

class PdfViewerControllerImpl implements CustomPdfController {
  final PdfViewerController _pdfViewerController = PdfViewerController();

  @override
  void nextPage() {
    _pdfViewerController.nextPage();
  }

  @override
  void previousPage() {
    _pdfViewerController.previousPage();
  }

  @override
  void zoomIn() {
    final double currentZoomLevel = _pdfViewerController.zoomLevel;
    _pdfViewerController.zoomLevel =
        currentZoomLevel + SettingsConstants.zoomInLevel;
  }

  @override
  void zoomOut() {
    final double currentZoomLevel = _pdfViewerController.zoomLevel;
    _pdfViewerController.zoomLevel =
        currentZoomLevel - SettingsConstants.zoomOutLevel;
  }

  @override
  void dispose() {
    _pdfViewerController.dispose();
  }

  @override
  Widget build(BuildContext context, String url) {
    if (url.isURL()) {
      return PDFView(
        url: url,
        pdfViewController: _pdfViewerController,
      );
    } else {
      return SizedBox();
    }
  }
}
