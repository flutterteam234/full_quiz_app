import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';
import 'package:riverpod_architecture/core/view/base_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_architecture/product/constants/color_constants.dart';
import 'package:riverpod_architecture/product/constants/image_constants.dart';

class AppNotificationsView extends StatelessWidget {
  const AppNotificationsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView(onPageBuilder: (BuildContext context, WidgetRef ref) {
      return Scaffold(
          backgroundColor: ColorConstants.smootGreen.getColor,
          appBar: _getAppBar(context),
          body: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 10,
              padding: context.padding.normal,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    Container(
                        padding: context.padding.normal,
                        width: double.infinity,
                        height: context.sized.dynamicHeight(0.2),
                        decoration: BoxDecoration(
                          color: ColorConstants.smootWhite.getColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Title",
                                style: GoogleFonts.baloo2(
                                  color: ColorConstants.black.getColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              height: context.sized.highValue,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      ImageConstants.homePageTop1.toImage),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            )
                          ],
                        )),
                    Padding(padding: context.padding.verticalLow),
                  ],
                );
              },
            ),
          ));
    });
  }

  PreferredSizeWidget _getAppBar(BuildContext context) {
    return AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        leadingWidth: 100,
        title: Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.keyboard_arrow_left_sharp,
                color: Color(ColorConstants.smootWhite.toRgba),
              ),
              iconSize: 40,
              color: Color(ColorConstants.black.toRgba),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'App',
                  style: GoogleFonts.baloo2(
                      fontWeight: FontWeight.w500,
                      wordSpacing: 1,
                      fontSize: 17,
                      color: ColorConstants.lightSilver.getColor),
                ),
                Text(
                  'Notifications',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5,
                      color: ColorConstants.smootWhite.getColor),
                ),
              ],
            ),
          ],
        ));
  }
}
