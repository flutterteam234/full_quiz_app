import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../product/constants/color_constants.dart';
import '../../product/widget/text/sub_title_text.dart';
import '../../product/widget/text/title_text.dart';

class NotesView extends StatelessWidget {
  const NotesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();

    return Scaffold(
      backgroundColor: ColorConstants.smootGreen.getColor,
      body: SafeArea(
          child: ListView(
        padding: EdgeInsets.only(
            left: context.sized.normalValue, right: context.sized.normalValue),
        children: [
          const _Header(),
          Padding(padding: context.padding.onlyTopNormal),
        ],
      )),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            InkWell(
              onTap: () {},
              child: const Icon(Icons.arrow_back_ios_outlined,
                  color: Colors.white, size: 30),
            ),
            Padding(padding: context.padding.horizontalLow),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TitleText(
                    text: 'All',
                    color: ColorConstants.smootWhite.getColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 18.0),
                Padding(
                  padding: context.padding.onlyTopLow,
                  child: SubTitleText(
                    text: 'Notes',
                    color: ColorConstants.smootWhite.getColor,
                    fontSize: 22.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),
        InkWell(
          onTap: () {},
          child: const Icon(Icons.search, size: 30.0, color: Colors.white),
        ),
      ],
    );
  }
}
