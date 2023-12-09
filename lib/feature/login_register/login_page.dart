import 'package:flutter/material.dart';
import 'package:riverpod_architecture/product/constants/image_constants.dart';
import 'package:riverpod_architecture/product/utility/firebase/firebase_auth.dart';
import 'package:riverpod_architecture/feature/login_register/register_page.dart';
import 'package:riverpod_architecture/product/constants/color_constants.dart';
import 'package:riverpod_architecture/product/widget/TextFieldWidget.dart';

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
      backgroundColor: ColorConstants.ligthGreen.getColor,
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Colors.teal.shade900,
          Colors.teal.shade800,
        ])),
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
                  icon: const Icon(
                    Icons.mail_outline,
                    color: Colors.white,
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
                      style: TextStyle(color: Colors.red),
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
                  icon: const Icon(
                    Icons.remove_red_eye_outlined,
                    color: Colors.white,
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
                      icon: const Icon(
                        Icons.remove_red_eye,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                passwordgoz: passwordToggle,
              ),
              const Spacer(
                flex: 5,
              ),
              InkWell(
                onTap: () {
                  AuthService().signIn(context,
                      email: mail_controller.text,
                      password: password_controller.text);
                },
                child: Card(
                  color: Color(0xFFa7e0d0),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Center(
                      child: Text(
                        "Giriş Yap",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                  ),
                ),
              ),
              const Spacer(
                flex: 50,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegisterPage(),
                      ));
                },
                child: const Text(
                  "Hesabınız yok mu ? Kayıt Ol",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
              const Spacer(
                flex: 3,
              )
            ],
          ),
        ),
      ),
    );
  }
}
