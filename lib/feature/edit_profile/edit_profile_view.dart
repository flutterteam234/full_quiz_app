import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kartal/kartal.dart';
import 'package:riverpod_architecture/core/view/base_view.dart';
import 'package:riverpod_architecture/feature/app_settings/components/change_photo_circle_avatar.dart';
import 'package:riverpod_architecture/feature/edit_profile/edit_profile_provider.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
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

    return BaseView<EditProfileNotifier, EditProfileState>(
        onInitState: (WidgetRef ref) {},
        onPageBuilder: (BuildContext context, WidgetRef ref) {
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
                  ),
                  Padding(padding: context.padding.verticalMedium),
                  Container(
                    margin: context.padding.horizontalNormal,
                    padding: context.padding.verticalNormal,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: ColorConstants.smootWhite.getColor,
                    ),
                    child: ListTile(
                      subtitle: Text("İsim",style: GoogleFonts.baloo2(
                        fontSize: 21,
                        fontWeight: FontWeight.w500,
                      ),), // fixme
                      title: Text(StringConstants.username,
                          style: GoogleFonts.baloo2(
                            color: ColorConstants.black.getColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          )),
                      trailing: Icon(
                        MdiIcons.pencilOutline,
                        size: context.sized.mediumValue,
                      ),
                    ),
                  )
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
