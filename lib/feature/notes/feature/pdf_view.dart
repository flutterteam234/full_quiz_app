import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';
import 'package:riverpod_architecture/core/view/base_view.dart';
import 'package:riverpod_architecture/feature/notes/components/notes_floating_action_buttons.dart';
import 'package:riverpod_architecture/feature/notes/notes_provider.dart';
import 'package:riverpod_architecture/generated/locale_keys.g.dart';
import 'package:riverpod_architecture/product/package/pdfViewer/pdfViewer_controller.dart';
import 'package:riverpod_architecture/product/widget/text/locale_text.dart';
import '../../../product/constants/color_constants.dart';

class PdfView extends StatelessWidget {
  const PdfView({Key? key, required this.url}) : super(key: key);

  final String? url;

  @override
  Widget build(BuildContext context) {
    final CustomPdfController pdfViewerController = PdfViewerControllerImpl();

    return BaseView<NotesNotifier, NotesState>(
        onPageBuilder: (BuildContext context, WidgetRef ref) {
      return Scaffold(
          backgroundColor: ColorConstants.smootGreen.getColor,
          body: url == null
              ? Container()
              : pdfViewerController.build(context, url!),
          appBar: _getAppBar(context),
          floatingActionButton:
              _floatingActionButtonsColumn(pdfViewerController, context));
    });
  }
}

PreferredSizeWidget _getAppBar(BuildContext context) {
  return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      leadingWidth: 100,
      title: Row(
        children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.keyboard_arrow_left_sharp,
              color: Color(ColorConstants.smootWhite.toRgba),
            ),
            iconSize: 40,
            color: Color(ColorConstants.black.toRgba),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LocaleText(
                text: LocaleKeys.general_app,
                textStyle: GoogleFonts.baloo2(
                    fontWeight: FontWeight.w500,
                    wordSpacing: 1,
                    fontSize: 17,
                    color: ColorConstants.lightSilver.getColor),
              ),
              LocaleText(
                text: LocaleKeys.appNotes_notes,
                textStyle: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.5,
                    color: ColorConstants.smootWhite.getColor),
              )
            ],
          ),
        ],
      ));
}

Widget _floatingActionButtonsColumn(
    CustomPdfController pdfViewerController, BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      NotesFloatingActionButtons(
          pdfViewerController: pdfViewerController,
          icon: Icons.zoom_out,
          function: pdfViewerController.zoomOut),
      context.sized.emptySizedHeightBoxLow,
      NotesFloatingActionButtons(
          pdfViewerController: pdfViewerController,
          icon: Icons.zoom_in,
          function: pdfViewerController.zoomIn),
      context.sized.emptySizedHeightBoxLow,
      NotesFloatingActionButtons(
          pdfViewerController: pdfViewerController,
          icon: Icons.arrow_upward,
          function: pdfViewerController.previousPage),
      context.sized.emptySizedHeightBoxLow,
      NotesFloatingActionButtons(
          pdfViewerController: pdfViewerController,
          icon: Icons.arrow_downward,
          function: pdfViewerController.nextPage),
    ],
  );
}
