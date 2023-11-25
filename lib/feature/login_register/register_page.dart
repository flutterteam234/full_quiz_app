import 'package:flutter/material.dart';
import 'package:riverpod_architecture/feature/auth/firebase_auth.dart';
import 'package:riverpod_architecture/feature/login_register/login_page.dart';
import 'package:riverpod_architecture/product/constants/color_constants.dart';
import 'package:riverpod_architecture/product/constants/text_family_constants.dart';

TextEditingController mail_controller = TextEditingController();
TextEditingController password_controller = TextEditingController();
TextEditingController name_controller = TextEditingController();
bool goster = true;

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
              Image.asset(
                "assets/icons/ic_logo.png",
                height: height / 3,
                width: width / 2.2,
              ),
              Text(
                "Giriş Yap",
                style: TextFamilyConstrants.titleLarge.getFont,
              ),
              Spacer(
                flex: 15,
              ),
              textfield(
                editingController: name_controller,
                yazi: "İsim",
                goz: const Padding(
                  padding: EdgeInsets.all(10.0),
                ),
                passwordgoz: false,
              ),
              const Spacer(
                flex: 1,
              ),
              textfield(
                editingController: mail_controller,
                yazi: "Email",
                goz: const Padding(
                  padding: EdgeInsets.all(10.0),
                ),
                passwordgoz: false,
              ),
              const Spacer(
                flex: 1,
              ),
              textfield(
                editingController: password_controller,
                yazi: "Şifre",
                goz: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: InkWell(
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          goster == false ? goster = true : goster = false;
                        });
                      },
                      icon: const Icon(
                        Icons.remove_red_eye,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                passwordgoz: goster,
              ),
              const Spacer(
                flex: 5,
              ),
              InkWell(
                onTap: () {
                  AuthService().signUp(context,
                      name: name_controller.text,
                      email: mail_controller.text,
                      password: password_controller.text);
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ));
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

class textfield extends StatelessWidget {
  const textfield(
      {Key? key,
      required TextEditingController editingController,
      required this.yazi,
      required this.goz,
      required this.passwordgoz})
      : _editingController = editingController,
        super(key: key);

  final TextEditingController _editingController;
  final String yazi;
  final Padding goz;
  final bool passwordgoz;
  // ignore: body_might_complete_normally_nullable
  String? validateEmail(String? value) {
    if (value != null) {
      if (value.length > 5 && value.contains('@') && value.endsWith('.com')) {
        return null;
      }
      return 'Geçerli bir e-posta adresi girin.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFFa7e0d0),

      /*  BoxDecoration(
        color: Color.fromARGB(255, 64, 68, 75),
        borderRadius: BorderRadius.circular(10),
      ),*/
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                validator: validateEmail,
                cursorColor: Colors.white,
                style: Theme.of(context).textTheme.titleMedium,
                obscureText: passwordgoz,
                controller: _editingController,
                decoration:
                    InputDecoration(hintText: yazi, border: InputBorder.none),
              ),
            ),
            goz,
          ],
        ),
      ),
    );
  }
}
