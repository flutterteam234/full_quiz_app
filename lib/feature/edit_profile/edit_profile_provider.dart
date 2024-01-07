import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:riverpod_architecture/product/utility/firebase/firebase_utility.dart';

class EditProfileNotifier extends StateNotifier<EditProfileState>
    with FirebaseUtility {
  EditProfileNotifier() : super(const EditProfileState());

  Future<void> selectPhotoFromGallery(ImagePicker imagePicker) async {
    final XFile? selectedPhoto =
        await imagePicker.pickImage(source: ImageSource.gallery);
    if (selectedPhoto != null) {
      state = state.copyWith(
          isSelectedPhoto: true, selectedGalleryPhoto: selectedPhoto);
    } else {}
  }
}

class EditProfileState {
  const EditProfileState(
      {this.isSelectedPhoto = false, this.selectedGalleryPhoto});

  final bool isSelectedPhoto;
  final XFile? selectedGalleryPhoto;

  EditProfileState copyWith({
    bool? isSelectedPhoto,
    XFile? selectedGalleryPhoto,
  }) {
    return EditProfileState(
      selectedGalleryPhoto: selectedGalleryPhoto ?? this.selectedGalleryPhoto,
      isSelectedPhoto: isSelectedPhoto ?? this.isSelectedPhoto,
    );
  }
}
