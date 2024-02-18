import 'package:flutter/material.dart';
import 'package:riverpod_architecture/product/utility/extentions/string_extentions.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PDFView extends StatefulWidget  {
  const PDFView({Key? key, required this.url, required this.pdfViewController})
      : super(key: key);

  final String url;
  final PdfViewerController pdfViewController;

  @override
  State<PDFView> createState() => _PDFViewState();
}

class _PDFViewState extends State<PDFView>  {
  @override
  Widget build(BuildContext context) {
    if (widget.url.isURL()) {
      return SfPdfViewer.network(
        widget.url,
        controller: widget.pdfViewController,
      );
    } else {
      return SizedBox.expand();
    }
  }
}

