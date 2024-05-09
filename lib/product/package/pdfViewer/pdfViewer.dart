import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/file.dart';
import 'package:riverpod_architecture/product/package/pdfViewer/pdfViewer_mixin.dart';
import 'package:riverpod_architecture/product/utility/extentions/string_extentions.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

 class PDFView extends StatefulWidget {
  const PDFView({Key? key, required this.url, required this.controller}) : super(key: key);

  final String url;
  final PdfViewerController controller;

  @override
  State<PDFView> createState() => _PDFViewState();
}

class _PDFViewState extends State<PDFView> with PDFViewMixin {
  @override
  Widget build(BuildContext context) {
    if (widget.url.isURL()) {
      return FutureBuilder<File?>(
        future: flutterCacheManager.getFile(widget.url),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final File? file = snapshot.data;
            if (file != null) {
              return SfPdfViewer.file(
                file,
                controller: widget.controller,
              );
            }
          }
          return const Text("");
        },
      );
    } else {
      return const SizedBox.expand();
    }
  }
}
