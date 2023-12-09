import 'package:flutter/material.dart';
import 'package:riverpod_architecture/feature/login_register/fonctions/textfield_control.dart';
import 'package:riverpod_architecture/product/constants/image_constants.dart';
import 'package:riverpod_architecture/product/constants/text_family_constants.dart';
import 'package:riverpod_architecture/product/navigation/enum/router_items.dart';
import 'package:riverpod_architecture/product/navigation/router.dart';
import 'package:riverpod_architecture/product/utility/firebase/firebase_auth.dart';
import 'package:riverpod_architecture/product/constants/color_constants.dart';
import 'package:riverpod_architecture/product/widget/TextFieldWidget.dart';

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
  bool logged = false;

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
                    Icons.person_outline,
                    color: Colors.white,
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
                onTap: () async {
                  bool success = registerUser(name_controller.text,
                      mail_controller.text, password_controller.text);
                  // ignore: await_only_futures
                  logged = await AuthService()
                      .checkEmailVerification(mail_controller.text);

                  if (success) {
                    // ignore: use_build_context_synchronously
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            backgroundColor: ColorConstants.ligthGreen.getColor,
                            title: Text('Email Doğrulama',
                                style: TextFamilyConstrants.bodyLarge.getFont),
                            content: Text(
                                'Lütfen mail hesabınızı kontrol ediniz ve doğrulamanızı gerçekleştiriniz.',
                                style: TextFamilyConstrants.bodyMedium.getFont),
                            actions: <Widget>[
                              TextButton(
                                child: Text("Tamam",
                                    style:
                                        TextFamilyConstrants.bodyLarge.getFont),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        });
                    print(logged.toString() + "LOGGED HEHEHEHEHEH");
                    if (logged) {
                      // ignore: use_build_context_synchronously
                      AuthService().signUp(context,
                          name: name_controller.text,
                          email: mail_controller.text,
                          password: password_controller.text);
                    } else {
                      print("KARDEŞİM DOĞRULAMA YAAAAAAAAAAAAP.(NOKTA)");
                    }
                  } else {
                    // ignore: use_build_context_synchronously
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            backgroundColor: ColorConstants.ligthGreen.getColor,
                            title: Text('Kayıt Başarısız',
                                style: TextFamilyConstrants.bodyLarge.getFont),
                            content: Text(
                                'Daha güçü bir şifre belirleyiniz veya geçerli bir mail adresi giriniz lütfen.',
                                style: TextFamilyConstrants.bodyMedium.getFont),
                            actions: <Widget>[
                              TextButton(
                                child: Text("Tamam",
                                    style:
                                        TextFamilyConstrants.bodyLarge.getFont),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        });
                  }
                },
                child: Card(
                  color: Color(0xFFa7e0d0),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Center(
                      child: Text(
                        "Kayıt Ol",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                  ),
                ),
              ),
              const Spacer(
                flex: 40,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context, RouterItems.login.goScreen());
                },
                child: const Text(
                  "Hesabınız var mı ? Giriş Yap",
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
