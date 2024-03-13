import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kartal/kartal.dart';
import 'package:riverpod_architecture/core/view/base_view.dart';
import 'package:riverpod_architecture/feature/app_settings/components/change_photo_circle_avatar.dart';
import 'package:riverpod_architecture/feature/edit_profile/components/user_contents_container.dart';
import 'package:riverpod_architecture/feature/edit_profile/edit_profile_provider.dart';
import 'package:riverpod_architecture/feature/edit_profile/enum/edit_profile_enum.dart';
import 'package:riverpod_architecture/generated/locale_keys.g.dart';
import 'package:riverpod_architecture/product/navigation/enum/router_items.dart';
import 'package:riverpod_architecture/product/navigation/router.dart';
import 'package:riverpod_architecture/product/widget/appbars/custom_app_bar.dart';
import '../../product/constants/color_constants.dart';
import '../../product/widget/buttons/save_button.dart';

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
            appBar: CustomAppBar(
                title: LocaleKeys.editProfile_edit,
                subTitle: LocaleKeys.editProfile_profile,
                function: () {
                  Navigator.push(context, RouterItems.appPreference.goScreen());
                }),
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
                      controller: controller),
                  Padding(padding: context.padding.verticalLow),
                  SaveButton(
                      title: LocaleKeys.editProfile_save,
                      style: ElevatedButton.styleFrom(
                        padding: context.padding.normal +
                            context.padding.horizontalNormal,
                        animationDuration: Durations.short1,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                      ),
                      function: () async {
                        await editProfileNotifier.saveContent();
                      }),
                ],
              ),
            )),
          );
        });
  }
}
