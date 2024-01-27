import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:riverpod_architecture/feature/edit_profile/edit_profile_provider.dart';
import '../../../product/constants/color_constants.dart';
import '../enum/edit_profile_enum.dart';

class UserContentsContainer extends StatelessWidget {
  const UserContentsContainer(
      {Key? key,
      required this.state,
      required this.notifier,
      required this.editProfileEnum,
      required this.controller})
      : super(key: key);

  final EditProfileState state;
  final EditProfileNotifier notifier;
  final EditProfileEnum editProfileEnum;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: context.padding.horizontalNormal,
      padding: context.padding.verticalNormal,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: ColorConstants.smootWhite.getColor,
      ),
      child: ListTile(
        subtitle: Text(
          '${editProfileEnum.getEnumText(state)}',
          style: GoogleFonts.baloo2(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
          overflow: TextOverflow.ellipsis,
        ),
        title: Text(editProfileEnum.getTitleText(),
            style: GoogleFonts.baloo2(
              color: ColorConstants.black.getColor,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            )),
        trailing: InkWell(
          onTap: () {
            notifier.resetController(editProfileEnum, controller);
            _showModalBottomSheet(
                context, editProfileEnum, state, controller, notifier);
          },
          child: Icon(
            MdiIcons.pencilOutline,
            size: context.sized.mediumValue,
          ),
        ),
      ),
    );
  }

  void _showModalBottomSheet(
      BuildContext context,
      EditProfileEnum editProfileEnum,
      EditProfileState editProfileState,
      TextEditingController controller,
      EditProfileNotifier editProfileNotifier) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            padding: context.padding.medium,
            child: TextField(
              maxLength: editProfileEnum.getInputLenght(),
              controller: controller,
              onChanged: (String? value) {
                editProfileNotifier.editContents(
                    editProfileEnum, value, controller);
              },
              decoration: InputDecoration(
                suffixIcon: Icon(MdiIcons.pencilOutline, size: 22.0),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide.none,
                ),
                filled: true,
              ),
            ),
          );
        });
  }
}
