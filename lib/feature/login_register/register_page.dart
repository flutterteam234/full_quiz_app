import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:riverpod_architecture/feature/login_register/fonctions/textfield_control.dart';
import 'package:riverpod_architecture/product/constants/image_constants.dart';
import 'package:riverpod_architecture/product/constants/string_constants.dart';
import 'package:riverpod_architecture/product/constants/text_family_constants.dart';
import 'package:riverpod_architecture/product/navigation/enum/router_items.dart';
import 'package:riverpod_architecture/product/navigation/router.dart';
import 'package:kartal/kartal.dart';
import 'package:riverpod_architecture/product/constants/color_constants.dart';
import 'package:riverpod_architecture/product/widget/TextFieldWidget.dart';
import 'package:riverpod_architecture/product/widget/login_register/ButtonWidget.dart';
import 'profile_photo_add.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController mail_controller = TextEditingController();
  TextEditingController password_controller = TextEditingController();
  TextEditingController name_controller = TextEditingController();

  bool passwordToggle = true;

  @override
  void dispose() {
    mail_controller.dispose();
    password_controller.dispose();
    name_controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstants.neutralWhite.getColor,
        body: Container(
          height: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: context.sized.normalValue),
          child: Column(
            children: [
              Padding(padding: context.padding.verticalMedium),
              Image.asset(
                ImageConstants.appIcon.toIcon,
                height: context.sized.dynamicHeight(0.25),
                width: context.sized.dynamicWidth(0.5),
              ),
              TextFieldWidget(
                icon: IconButton(
                  enableFeedback: false,
                  onPressed: () {},
                  icon: Icon(
                    Icons.person_outline,
                    color: ColorConstants.ligthGreen.getColor,
                  ),
                ),
                editingController: name_controller,
                metin: StringConstants.username,
                eye: const Padding(
                  padding: EdgeInsets.all(10.0),
                ),
                passwordgoz: false,
              ),
              Padding(padding: context.padding.verticalLow),
              TextFieldWidget(
                icon: IconButton(
                  enableFeedback: false,
                  onPressed: () {},
                  icon: Icon(
                    Icons.mail_outline,
                    color: ColorConstants.ligthGreen.getColor,
                  ),
                ),
                editingController: mail_controller,
                metin: StringConstants.email,
                eye: const Padding(
                  padding: EdgeInsets.all(10.0),
                ),
                passwordgoz: false,
              ),
              Padding(padding: context.padding.verticalLow),
              TextFieldWidget(
                icon: IconButton(
                  onPressed: () {
                    setState(() {
                      passwordToggle == false
                          ? passwordToggle = true
                          : passwordToggle = false;
                    });
                  },
                  icon: Icon(
                    passwordToggle
                        ? Icons.remove_red_eye_outlined
                        : Icons.remove_red_eye_sharp, // fix here
                    color: ColorConstants.ligthGreen.getColor,
                  ),
                ),
                editingController: password_controller,
                metin: StringConstants.password,
                eye: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: InkWell(
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          passwordToggle == false
                              ? passwordToggle = true
                              : passwordToggle = false;
                        });
                      },
                      icon: Icon(
                        Icons.remove_red_eye,
                        color: ColorConstants.black.getColor,
                      ),
                    ),
                  ),
                ),
                passwordgoz: passwordToggle,
              ),
              Padding(padding: context.padding.verticalLow),
              CustomButton(
                  onTap: () async {
                    bool success = registerUser(name_controller.text,
                        mail_controller.text, password_controller.text);
                    // ignore: await_only_futures

                    if (success) {
                      // ignore: use_build_context_synchronously
                      _showMyDialog(context, StringConstants.emailVerification,
                          StringConstants.checkYourMail, StringConstants.okey);

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PPAdd(
                                name: name_controller.text,
                                mail: mail_controller.text,
                                password: password_controller.text),
                          ));
                    } else {
                      // ignore: use_build_context_synchronously
                      _showMyDialog(
                          context,
                          StringConstants.registrationFailed,
                          StringConstants.strongPasswordPlease,
                          StringConstants.okey);
                    }
                  },
                  text: StringConstants.register),
              Padding(padding: context.padding.verticalLow),
              InkWell(
                onTap: () {
                  Navigator.push(context, RouterItems.login.goScreen());
                },
                child: Text(StringConstants.doYouHaveAccount,
                    style: GoogleFonts.baloo2(
                        color: ColorConstants.black.getColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 17)),
              ),
            ],
          ),
        ));
  }

  void _showMyDialog(BuildContext context, String titleText, String contentText,
      String childText) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: ColorConstants.black.getColor,
          title: Text(titleText, style: TextFamilyConstrants.bodyLarge.getFont),
          content:
              Text(contentText, style: TextFamilyConstrants.bodyMedium.getFont),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(childText,
                  style: GoogleFonts.baloo2(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: ColorConstants.black.getColor,
                  )),
            ),
          ],
        );
      },
    );
  }
}
