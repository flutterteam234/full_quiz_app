import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart' as firebase;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kartal/kartal.dart';
import 'package:riverpod_architecture/feature/auth/authentication_provider.dart';
import 'package:riverpod_architecture/product/constants/color_constants.dart';
import 'package:riverpod_architecture/product/constants/image_constants.dart';
import 'package:riverpod_architecture/product/constants/string_constants.dart';
import 'package:riverpod_architecture/product/widget/text/sub_title_text.dart';
import 'package:riverpod_architecture/product/widget/text/title_text.dart';

class AuthenticationView extends ConsumerStatefulWidget {
  const AuthenticationView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AuthenticationViewState();
}

class _AuthenticationViewState extends ConsumerState<AuthenticationView> {
  final authProvider =
      StateNotifierProvider<AuthenticationNotifier, AuthenticationState>((ref) {
    return AuthenticationNotifier();
  });

  @override
  void initState() {
    super.initState();
    checkUser(FirebaseAuth.instance.currentUser);
  }

  void checkUser(User? user) {
    ref.read(authProvider.notifier).fetchUserDetail(user);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstants.ligthGreen.getColor,
        body: SingleChildScrollView(
          child: firebase.FirebaseUIActions(
            actions: [
              AuthStateChangeAction<SignedIn>((context, state) {
                if (state.user != null) checkUser(state.user);
              }),
            ],
            child: SafeArea(
              top: true,
              child: Padding(
                padding: context.padding.low,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const _Logo(),
                      TitleText(
                        color: ColorConstants.lightSilver.getColor,
                        text: ref.watch(authProvider).isRedirect
                            ? StringConstants.loginWelcomeBack
                            : StringConstants.loginWelcome,
                      ),
                      Padding(
                        padding: context.padding.onlyTopNormal,
                        child: SubTitleText(
                          color: ColorConstants.lightSilver.getColor,
                          text: ref.watch(authProvider).isRedirect
                              ? StringConstants.loginWelcomeBackDetail
                              : StringConstants.loginWelcomeDetail,
                        ),
                      ),
                      const _FirebaseAuth(),
                      if (ref.watch(authProvider).isRedirect)
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            StringConstants.continueToApp,
                            textAlign: TextAlign.center,
                          ),
                        )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}

class _Logo extends StatelessWidget {
  const _Logo();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: context.padding.medium,
        child: Image.asset(ImageConstants.appIcon.toIcon));
  }
}

class _FirebaseAuth extends StatelessWidget {
  const _FirebaseAuth();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding.normal,
      child: firebase.LoginView(
        action: AuthAction.signIn,
        showTitle: false,
        providers: firebase.FirebaseUIAuth.providersFor(
          FirebaseAuth.instance.app,
        ),
      ),
    );
  }
}

// fixme

/*
class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TitleText(
          value: StringConstants.loginWelcomeBack,
        ),
        Padding(
          padding: context.padding.onlyTopNormal,
          child: const SubTitleText(
            value: StringConstants.loginWelcomeDetail,
          ),
        ),
      ],
    );
  }
}


 */
