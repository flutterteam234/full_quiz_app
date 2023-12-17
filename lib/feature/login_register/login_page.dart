import 'package:flutter/material.dart';
import 'package:riverpod_architecture/product/constants/image_constants.dart';
import 'package:riverpod_architecture/product/utility/firebase/firebase_auth.dart';
import 'package:riverpod_architecture/feature/login_register/register_page.dart';
import 'package:riverpod_architecture/product/constants/color_constants.dart';
import 'package:riverpod_architecture/product/widget/TextFieldWidget.dart';
import 'package:riverpod_architecture/product/widget/login_register/ButtonWidget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController mail_controller = TextEditingController();
  TextEditingController password_controller = TextEditingController();

  bool passwordToggle = true;

  @override
  void dispose() {
    mail_controller.dispose();
    password_controller.dispose();
    super.dispose();
  }

  bool isVerificationCodeSent = false;
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
              isVerificationCodeSent == true
                  ? Text(
                      "Mail adresinize doğrulama gönderildi lütfen kontrol eder misiniz.",
                      style: TextStyle(color: ColorConstants.darkRed.getColor),
                    )
                  : Container(),
              const Spacer(
                flex: 5,
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
                  onTap: () {
                    AuthService().signIn(context,
                        email: mail_controller.text,
                        password: password_controller.text);
                  },
                  text: "Giriş Yap"),
              const Spacer(
                flex: 3,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegisterPage(),
                      ));
                },
                child: Text(
                  "Hesabınız yok mu ? Kayıt Ol",
                  style: TextStyle(
                      color: ColorConstants.black.getColor, fontSize: 16),
                ),
              ),
              const Spacer(
                flex: 50,
              )
            ],
          ),
        ),
      ),
    );
  }
}
