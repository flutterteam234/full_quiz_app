import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:riverpod_architecture/product/constants/color_constants.dart';
import 'package:riverpod_architecture/product/constants/string_constants.dart';
import 'package:riverpod_architecture/product/navigation/enum/router_items.dart';
import 'package:riverpod_architecture/product/navigation/router.dart';
import 'package:riverpod_architecture/product/utility/firebase/firebase_auth.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:sweep_animation_button/sweep_animation_button.dart';
import 'package:kartal/kartal.dart';
import '../../product/constants/image_constants.dart';

File? changedPhoto;

class PPAdd extends StatefulWidget {
  const PPAdd({this.name, this.mail, this.password, super.key});

  final String? name;
  final String? mail;
  final String? password;

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
    return Scaffold(
      backgroundColor: ColorConstants.neutralWhite.getColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () {
            Navigator.push(context, RouterItems.register.goScreen());
          },
          child: Icon(Icons.arrow_back_ios_outlined,
              color: ColorConstants.smootGreen.getColor, size: 25),
        ),
        title: Text(StringConstants.selectPhoto,
            style: GoogleFonts.baloo2(
              color: ColorConstants.ligthGreen.getColor,
              fontSize: 22,
              fontWeight: FontWeight.w600,
            )),
      ),
      body: Center(
        child: Column(
          children: [
            Image.asset(
              ImageConstants.appIcon.toIcon,
              height: context.sized.dynamicHeight(0.25),
              width: context.sized.dynamicWidth(0.5),
            ),
            Stack(
              clipBehavior: Clip.none,
              children: [
                CircleAvatar(
                  backgroundColor: ColorConstants.lightSilver.getColor,
                  radius: 90,
                  child: changedPhoto == null
                      ? const CircleAvatar(
                          radius: 85,
                          backgroundImage:
                              NetworkImage(StringConstants.addPhotoUrl),
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
                      constraints:
                          const BoxConstraints(minWidth: 70.0, minHeight: 36.0),
                      onPressed: () {
                        choicePhoto();
                      },
                      elevation: 2.0,
                      fillColor:  ColorConstants.smootGreen.getColor,
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
            Padding(padding: context.padding.verticalNormal),
            Text(
              widget.name ?? '',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            _SweepAnimationButton(
              widget: widget,
            ),
          ],
        ),
      ),
    );
  }
}

class _SweepAnimationButton extends StatelessWidget {
  const _SweepAnimationButton({Key? key, required this.widget})
      : super(key: key);

  final PPAdd widget;

  @override
  Widget build(BuildContext context) {
    return SweepAnimationButton(
      width: context.sized.dynamicWidth(0.7),
      height: 50,
      animationProgressColor: ColorConstants.smootWhite.getColor,
      borderRadius: 50,
      animationColor:  ColorConstants.ligthGreen.getColor,
      backroundColor: ColorConstants.smootGreen.getColor,
      durationCircle: 2,
      hideIcon: true,
      child: Text(
        StringConstants.register,
        style: GoogleFonts.baloo2(
          fontWeight: FontWeight.w500,
          fontSize: 16,
          color: ColorConstants.black.getColor,
        ),
      ),
      onTap: () {
        AuthService().signUp(context,
            name: widget.name ?? '',
            email: widget.mail ?? '',
            password: widget.password ?? '',
            imageFile: changedPhoto);
      },
    );
  }
}
