import 'package:riverpod_architecture/product/package/pdfViewer/pdfViewer.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';



mixin PDFViewMixin on State<PDFView> {
  late final PdfViewerController _pdfViewerController;

  PdfViewerController get pdfViewerController => _pdfViewerController;

  @override
  void initState() {
    super.initState();
    _pdfViewerController = PdfViewerController();
  }

  @override
  void dispose() {
    _pdfViewerController.dispose();
    super.dispose();
  }

}
