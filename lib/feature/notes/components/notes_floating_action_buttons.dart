import 'package:flutter/material.dart';
import 'package:riverpod_architecture/product/package/pdfViewer/pdfViewer_controller.dart';

class NotesFloatingActionButtons extends StatelessWidget {
  const NotesFloatingActionButtons(
      {Key? key,
      required this.pdfViewerController,
      required this.icon,
      this.function})
      : super(key: key);

  final CustomPdfController pdfViewerController;

  final IconData icon;

  final Function()? function;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: function,
      child: Icon(icon),
    );
  }
}
