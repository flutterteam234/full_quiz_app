import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_architecture/core/view/base_view.dart';
import 'package:kartal/kartal.dart';
import 'package:riverpod_architecture/product/utility/firebase/firebase_auth.dart';
import '../../product/widget/text/sub_title_text.dart';
import '../../product/widget/text/title_text.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView(onPageBuilder: (BuildContext context, WidgetRef ref) {
      return Scaffold(
        body: SafeArea(
            child: ListView(
          children: const [
            _Header(),
          ],
        )),
      );
    });
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TitleText(text: 'Welcome', color: Colors.red),
        Padding(
          padding: context.padding.onlyTopLow,
          child: const SubTitleText(text: '', color: Colors.red),
        ),
      ],
    );
  }
}
