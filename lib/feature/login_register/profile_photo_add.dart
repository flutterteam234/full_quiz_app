import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:riverpod_architecture/product/constants/color_constants.dart';
import 'package:riverpod_architecture/product/utility/firebase/firebase_auth.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:sweep_animation_button/sweep_animation_button.dart';

import '../../product/constants/image_constants.dart';

File? changedPhoto;

class PPAdd extends StatefulWidget {
  const PPAdd(
      {required this.name,
      required this.mail,
      required this.password,
      super.key});
  final String name;
  final String mail;
  final String password;

  @override
  State<PPAdd> createState() => _PPAddState();
}

class _PPAddState extends State<PPAdd> {
  final picker = ImagePicker();
  Future<void> choicePhoto() async {
    final secilenResim = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (secilenResim != null) {
        changedPhoto = File(secilenResim.path);
      } else {
        print("Resim seçilmedi.");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: ColorConstants.neutralWhite.getColor,
      appBar: AppBar(
        title: Text("Profil Fotoğrafını Seç",
            style: Theme.of(context).textTheme.titleLarge),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Image.asset(
              ImageConstants.appIcon.toIcon,
              height: height / 4,
              width: width / 2,
            ),
            Center(
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  CircleAvatar(
                    backgroundColor: Theme.of(context).iconTheme.color,
                    radius: 90,
                    child: changedPhoto == null
                        ? const CircleAvatar(
                            radius: 85,
                            backgroundImage: NetworkImage(
                                "https://i.pinimg.com/564x/2a/2e/7f/2a2e7f0f60b750dfb36c15c268d0118d.jpg"),
                          )
                        : CircleAvatar(
                            backgroundColor: Theme.of(context).iconTheme.color,
                            radius: 100,
                            backgroundImage: FileImage(changedPhoto!),
                          ),
                  ),
                  Positioned(
                      bottom: 0,
                      right: -15,
                      child: RawMaterialButton(
                        constraints: const BoxConstraints(
                            minWidth: 70.0, minHeight: 36.0),
                        onPressed: () {
                          choicePhoto();
                          print("Selaaam");
                        },
                        elevation: 2.0,
                        fillColor: Theme.of(context).iconTheme.color,
                        padding: const EdgeInsets.all(15.0),
                        shape: const CircleBorder(),
                        child: Icon(
                          size: 25,
                          Icons.add_photo_alternate_outlined,
                          color: Theme.of(context).colorScheme.background,
                        ),
                      )),
                ],
              ),
            ),
            const Spacer(
              flex: 1,
            ),
            Text(
              widget.name,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const Spacer(
              flex: 15,
            ),
            SweepAnimationButton(
              width: width / 1.6,
              height: 50,
              animationProgressColor: Colors.white,
              borderRadius: 50,
              animationColor: Colors.black,
              backroundColor: Colors.grey.shade400,
              durationCircle: 2,
              hideIcon: true,
              child: Text(
                "Kayıt Ol",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey.shade200,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1,
                ),
              ),
              onTap: () {
                print(changedPhoto.toString() + "FOTOĞRAAFFFFFFFFFF");
                AuthService().signUp(context,
                    name: widget.name,
                    email: widget.mail,
                    password: widget.password,
                    imageFile: changedPhoto);
              },
            ),
            const Spacer(
              flex: 10,
            ),
          ],
        ),
      ),
    );
  }
}
