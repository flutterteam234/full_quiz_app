import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';
import 'package:riverpod_architecture/core/view/base_view.dart';
import 'package:riverpod_architecture/feature/notes/components/notes_container.dart';
import 'package:riverpod_architecture/feature/notes/notes_provider.dart';
import 'package:riverpod_architecture/generated/locale_keys.g.dart';
import 'package:riverpod_architecture/product/models/notesModel.dart';
import 'package:riverpod_architecture/product/models/subNotesModel.dart';
import 'package:riverpod_architecture/product/navigation/router.dart';
import 'package:riverpod_architecture/product/widget/text/locale_text.dart';
import '../../../product/constants/color_constants.dart';
import '../../../product/navigation/enum/router_items.dart';

class AppNotesView extends StatelessWidget {
  const AppNotesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final notesProvider =
        StateNotifierProvider<NotesNotifier, NotesState>((ref) {
      return NotesNotifier();
    });

    return BaseView<NotesNotifier, NotesState>(onInitState: (WidgetRef ref) {
      ref.read(notesProvider.notifier).init();
    }, onPageBuilder: (BuildContext context, WidgetRef ref) {
      final NotesState notesState = ref.watch(notesProvider);
      final NotesNotifier notesNotifier = ref.read(notesProvider.notifier);

      return Scaffold(
        backgroundColor: ColorConstants.smootGreen.getColor,
        body: notesState.isLoading
            ? const LinearProgressIndicator()
            : _getBody(context, notesState, notesNotifier),
        appBar: _getAppBar(context),
      );
    });
  }
}

Widget _getBody(
  BuildContext context,
  NotesState notesState,
  NotesNotifier notesNotifier,
) {
  if (notesState.selectedNoteIndex != null) {
    if (notesState.notesContent?[notesState.selectedNoteIndex!] != null) {
      return SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: ListView.builder(
            padding: context.padding.low,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              SubNotesModel? subNotesModel = notesState
                  .notesContent![notesState.selectedNoteIndex!]!.subNotes;
              if (subNotesModel == null) return const SizedBox();
              return NotesContainer(
                  backgroundImagePath: subNotesModel.imagePaths![index],
                  title: subNotesModel.titles![index],
                  function: () {
                    Navigator.push(
                        context,
                        RouterItems.pdfView
                            .goScreen(url: subNotesModel.notePaths![index]));
                  });
            },
            itemCount: notesState.notesContent![notesState.selectedNoteIndex!]!
                .subNotes!.titles!.length),
      );
    } else {
      return const SizedBox();
    }
  } else {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: ListView.builder(
        padding: context.padding.low,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          NotesModel notesModel = notesState.notesContent![index]!;

          return Column(
            children: [
              Padding(padding: context.padding.verticalLow),
              NotesContainer(
                  backgroundImagePath: notesModel.imagePath,
                  title: notesModel.title,
                  function: () {
                    notesNotifier.setSelectedNoteIndex(index);
                  })
            ],
          );
        },
        shrinkWrap: true,
        itemCount: notesState.notesContent!.length,
      ),
    );
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
              Navigator.push(context, RouterItems.home.goScreen());
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
