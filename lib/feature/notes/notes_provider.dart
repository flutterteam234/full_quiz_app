import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_architecture/product/models/notesModel.dart';
import 'package:riverpod_architecture/product/models/subNotesModel.dart';
import 'package:riverpod_architecture/product/utility/firebase/firebase_utility.dart';
import '../../product/utility/firebase/firebase_collections.dart';

class NotesNotifier extends StateNotifier<NotesState> with FirebaseUtility {
  NotesNotifier() : super(const NotesState());

  Future<void> init() async {
    await loadNotes();
    setIsLoading(false);
  }

  Future<void> loadNotes() async {
    FirebaseCollections notesCollection = FirebaseCollections.notes;

    List<NotesModel?> lastData = [];

    List<NotesModel?>? notesData =
        await fetchList(const NotesModel(), notesCollection);
    if (notesData == null) return;

    for (NotesModel? x in notesData) {
      if (x == null) return;

      SubNotesModel? subNotesData = await fetchDocument(
          x.id!, const SubNotesModel(), FirebaseCollections.subNotes);

      if (subNotesData != null) {
        NotesModel newNotesModel = x.copyWith(subNotes: subNotesData);
        lastData.add(newNotesModel);
      } else {
        lastData.add(x);
      }
    }

    state = state.copyWith(notesContent: lastData);
  }

  void setSelectedNoteIndex(int index) {
    state = state.copyWith(selectedNoteIndex: index);
  }

  void setIsLoading(bool value) {
    state = state.copyWith(isLoading: value);
  }
}

class NotesState {
  const NotesState(
      {this.isLoading = true, this.notesContent, this.selectedNoteIndex});

  final bool isLoading;
  final List<NotesModel?>? notesContent;
  final int? selectedNoteIndex;

  List<Object?> get props => [isLoading, notesContent, selectedNoteIndex];

  NotesState copyWith(
      {bool? isLoading,
      List<NotesModel?>? notesContent,
      int? selectedNoteIndex}) {
    return NotesState(
        isLoading: isLoading ?? this.isLoading,
        notesContent: notesContent ?? this.notesContent,
        selectedNoteIndex: selectedNoteIndex ?? this.selectedNoteIndex);
  }
}
