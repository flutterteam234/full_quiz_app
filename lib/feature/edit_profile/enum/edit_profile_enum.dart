import 'package:riverpod_architecture/product/constants/settings_constants.dart';
import 'package:riverpod_architecture/product/constants/string_constants.dart';
import 'package:riverpod_architecture/product/utility/extentions/string_extentions.dart';

import '../edit_profile_provider.dart';

enum EditProfileEnum { username, email, password }

extension EditProfileEnumExtentions on EditProfileEnum {
  String? getEnumText(EditProfileState editProfileState) {
    switch (this) {
      case EditProfileEnum.username:
        return editProfileState.username;
      case EditProfileEnum.email:
        return editProfileState.email;
      case EditProfileEnum.password:
        return editProfileState.password.maskCharacters();
    }
  }

  String getTitleText() {
    switch (this) {
      case EditProfileEnum.username:
        return StringConstants.username;
      case EditProfileEnum.email:
        return StringConstants.email;
      case EditProfileEnum.password:
        return StringConstants.password;
    }
  }

  int getInputLenght() {
    switch (this) {
      case EditProfileEnum.username:
        return SettingsConstants.inputLenghtUsername;
      case EditProfileEnum.email:
        return 100;
      case EditProfileEnum.password:
        return SettingsConstants.inputLenghtPassword;
    }
  }
}
