import 'package:flutter/material.dart';
import 'package:riverpod_architecture/feature/login_register/fonctions/textfield_control.dart';
import 'package:riverpod_architecture/product/constants/image_constants.dart';
import 'package:riverpod_architecture/product/constants/text_family_constants.dart';
import 'package:riverpod_architecture/product/navigation/enum/router_items.dart';
import 'package:riverpod_architecture/product/navigation/router.dart';
import 'package:riverpod_architecture/product/utility/firebase/firebase_auth.dart';
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
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: ColorConstants.neutralWhite.getColor,
      body: Container(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              const Spacer(
                flex: 20,
              ),
              Image.asset(
                ImageConstants.appIcon.toIcon,
                height: height / 4,
                width: width / 2,
              ),
              const Spacer(
                flex: 10,
              ),
              TextFieldWidget(
                icon: IconButton(
                  enableFeedback: false,
                  onPressed: () {},
                  icon: Icon(
                    Icons.person_outline,
                    color: ColorConstants.black.getColor,
                  ),
                ),
                editingController: name_controller,
                metin: "İsim",
                eye: const Padding(
                  padding: EdgeInsets.all(10.0),
                ),
                passwordgoz: false,
              ),
              const Spacer(
                flex: 1,
              ),
              TextFieldWidget(
                icon: IconButton(
                  enableFeedback: false,
                  onPressed: () {},
                  icon: Icon(
                    Icons.mail_outline,
                    color: ColorConstants.black.getColor,
                  ),
                ),
                editingController: mail_controller,
                metin: "Email",
                eye: const Padding(
                  padding: EdgeInsets.all(10.0),
                ),
                passwordgoz: false,
              ),
              const Spacer(
                flex: 1,
              ),
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
                    Icons.remove_red_eye_outlined,
                    color: ColorConstants.black.getColor,
                  ),
                ),
                editingController: password_controller,
                metin: "Şifre",
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
              const Spacer(
                flex: 5,
              ),
              CustomButton(
                  onTap: () async {
                    bool success = registerUser(name_controller.text,
                        mail_controller.text, password_controller.text);
                    // ignore: await_only_futures

                    if (success) {
                      // ignore: use_build_context_synchronously
                      _showMyDialog(
                          context,
                          "Email Doğrulama",
                          "Lütfen mail hesabınızı kontrol ediniz ve doğrulamanızı gerçekleştiriniz.",
                          "Tamam");

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
                          "Kayıt Başarısız",
                          "Daha güçü bir şifre belirleyiniz veya geçerli bir mail adresi giriniz lütfen.",
                          "Tamam");
                    }
                  },
                  text: "Kayıt Ol"),
              const Spacer(
                flex: 3,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context, RouterItems.login.goScreen());
                },
                child: Text(
                  "Hesabınız var mı ? Giriş Yap",
                  style: TextStyle(
                      color: ColorConstants.black.getColor, fontSize: 16),
                ),
              ),
              const Spacer(
                flex: 40,
              )
            ],
          ),
        ),
      ),
    );
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
                  style: TextFamilyConstrants.bodyLarge.getFont),
            ),
          ],
        );
      },
    );
  }
}
