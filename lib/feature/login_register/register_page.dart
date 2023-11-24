import 'package:flutter/material.dart';
import 'package:riverpod_architecture/product/constants/color_constants.dart';
import 'package:riverpod_architecture/product/constants/image_constants.dart';
import 'package:riverpod_architecture/product/constants/text_family_constants.dart';

TextEditingController _editingController = TextEditingController();
TextEditingController _passwordController = TextEditingController();
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
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/background/Login-Register.png"),
                  fit: BoxFit.fill)),
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20),
            child: Column(
              children: [
                const Spacer(
                  flex: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(80.0),
                  child: ImageConstants.appIcon.toIconAsset,
                ),
                const Spacer(
                  flex: 10,
                ),
                textfield(
                  editingController: _editingController,
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
                  editingController: _passwordController,
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
                  flex: 4,
                ),
                InkWell(
                  onTap: () {
                    // AuthService().signIn(context,
                    //     email: _editingController.text,
                    //     password: _passwordController.text);
                    // _editingController.clear();
                    // _passwordController.clear();
                  },
                  child: Card(
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
                  flex: 40,
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
          )),
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
      color: Theme.of(context).cardColor,

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
                decoration: InputDecoration(
                    hintStyle: Theme.of(context).textTheme.titleMedium,
                    hintText: yazi,
                    border: InputBorder.none),
              ),
            ),
            goz,
          ],
        ),
      ),
    );
  }
}
