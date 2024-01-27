import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:riverpod_architecture/product/utility/firebase/firebase_user.dart';
import 'package:riverpod_architecture/product/utility/firebase/firebase_utility.dart';

import 'enum/edit_profile_enum.dart';

class EditProfileNotifier extends StateNotifier<EditProfileState>
    with FirebaseUtility {
  EditProfileNotifier()
      : super(EditProfileState.fromFirebaseUser(FirebaseUser.instance));

  void editContents(EditProfileEnum editProfileEnum, String? newValue,
      TextEditingController controller) {
    switch (editProfileEnum) {
      case EditProfileEnum.username:
        controller.text = newValue!;
        state = state.copyWith(username: newValue);
        break;
      case EditProfileEnum.email:
        controller.text = newValue!;

        state = state.copyWith(email: newValue);
        break;
      case EditProfileEnum.password:
        controller.text = newValue!;

        state = state.copyWith(password: newValue);
        break;
    }
  }

  void resetController(
      EditProfileEnum editProfileEnum, TextEditingController controller) {
    switch (editProfileEnum) {
      case EditProfileEnum.username:
        controller.text = state.username!;
        break;
      case EditProfileEnum.email:
        controller.text = state.email!;

        break;
      case EditProfileEnum.password:
        controller.text = state.password!;

        break;
    }
  }

  Future<void> selectPhotoFromGallery(ImagePicker imagePicker) async {
    final XFile? selectedPhoto =
        await imagePicker.pickImage(source: ImageSource.gallery);
    if (selectedPhoto != null) {
      print("eklendi");
      state = state.copyWith(
          isSelectedPhoto: true, selectedGalleryPhoto: File(selectedPhoto.path));
    } else {}
  }
}

class EditProfileState {
  const EditProfileState({
    this.isSelectedPhoto = false,
    this.selectedGalleryPhoto,
    this.username,
    this.email,
    this.password,
  });

  final bool isSelectedPhoto;
  final File? selectedGalleryPhoto;
  final String? username;
  final String? email;
  final String? password;

  factory EditProfileState.fromFirebaseUser(FirebaseUser? firebaseUser) {
    return EditProfileState(
      username: firebaseUser?.userData?.name,
      email: firebaseUser?.userData?.email,
      password: firebaseUser?.userData?.password,
    );
  }

  EditProfileState copyWith({
    bool? isSelectedPhoto,
    File? selectedGalleryPhoto,
    String? username,
    String? email,
    String? password,
  }) {
    return EditProfileState(
      selectedGalleryPhoto: selectedGalleryPhoto ?? this.selectedGalleryPhoto,
      isSelectedPhoto: isSelectedPhoto ?? this.isSelectedPhoto,
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
