import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kartal/kartal.dart';
import 'package:riverpod_architecture/core/view/base_view.dart';
import 'package:riverpod_architecture/feature/app_settings/components/change_photo_circle_avatar.dart';
import 'package:riverpod_architecture/feature/edit_profile/components/user_contents_container.dart';
import 'package:riverpod_architecture/feature/edit_profile/edit_profile_provider.dart';
import 'package:riverpod_architecture/feature/edit_profile/enum/edit_profile_enum.dart';
import '../../product/constants/color_constants.dart';
import '../../product/constants/string_constants.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final editProfileProvider =
        StateNotifierProvider<EditProfileNotifier, EditProfileState>((ref) {
      return EditProfileNotifier();
    });

    final ImagePicker imagePicker = ImagePicker();
    final TextEditingController controller = TextEditingController();

    return BaseView<EditProfileNotifier, EditProfileState>(
        onInitState: (WidgetRef ref) {},
        onDispose: () {
          controller.dispose();
        },
        onPageBuilder: (BuildContext context, WidgetRef ref) {
          final editProfileState = ref.watch(editProfileProvider);
          final editProfileNotifier = ref.read(editProfileProvider.notifier);

          return Scaffold(
            backgroundColor: ColorConstants.smootGreen.getColor,
            appBar: _getAppBar(context),
            body: SingleChildScrollView(
                child: Center(
              child: Column(
                children: [
                  Padding(padding: context.padding.verticalNormal),
                  ChangePhotoCircleAvatar(
                    radius: context.sized.mediumValue,
                    function: () {
                      ref
                          .read(editProfileProvider.notifier)
                          .selectPhotoFromGallery(imagePicker);
                    },
                    photoFromGallery: editProfileState.selectedGalleryPhoto,
                  ),
                  Padding(padding: context.padding.verticalMedium),
                  UserContentsContainer(
                      state: editProfileState,
                      notifier: editProfileNotifier,
                      editProfileEnum: EditProfileEnum.username,
                      controller: controller),
                  Padding(padding: context.padding.verticalNormal),
                  UserContentsContainer(
                      state: editProfileState,
                      notifier: editProfileNotifier,
                      editProfileEnum: EditProfileEnum.email,
                      controller: controller),
                  Padding(padding: context.padding.verticalNormal),
                  UserContentsContainer(
                      state: editProfileState,
                      notifier: editProfileNotifier,
                      editProfileEnum: EditProfileEnum.password,
                      controller: controller)
                ],
              ),
            )),
          );
        });
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
                Text(
                  StringConstants.edit,
                  style: GoogleFonts.baloo2(
                      fontWeight: FontWeight.w500,
                      wordSpacing: 1,
                      fontSize: 17,
                      color: ColorConstants.lightSilver.getColor),
                ),
                Text(
                  StringConstants.profile,
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5,
                      color: ColorConstants.smootWhite.getColor),
                ),
              ],
            ),
          ],
        ));
  }
}
