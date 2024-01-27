import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_architecture/feature/splash/splash_provider.dart';
import 'package:riverpod_architecture/product/constants/color_constants.dart';
import 'package:riverpod_architecture/product/constants/image_constants.dart';
import 'package:kartal/kartal.dart';
import '../../product/utility/firebase/firebase_auth.dart';

class SplashView extends ConsumerStatefulWidget {
  const SplashView({super.key});

  @override
  ConsumerState createState() => _SplashViewState();
}

class _SplashViewState extends ConsumerState<SplashView>
    with _SplashViewListenMixin {
  final splashProvider =
      StateNotifierProvider<SplashNotifier, SplashState>((ref) {
    return SplashNotifier();
  });

  @override
  void initState() {
    ref.read(splashProvider.notifier).appInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    listenAndNavigate(splashProvider);

    return Scaffold(
      backgroundColor: ColorConstants.smootGreen.getColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: context.padding.horizontalHigh,
              child: Image.asset(ImageConstants.appIcon.toIcon,
                  alignment: Alignment.center),
            )
          ],
        ),
      ),
    );
  }
}

mixin _SplashViewListenMixin on ConsumerState<SplashView> {
  void listenAndNavigate(
    StateNotifierProvider<SplashNotifier, SplashState> provider,
  ) {
    ref.listen<SplashState>(provider, (previous, next) {
      if (next.isLoading) {
      } else {
        AuthService().checkLoginStatus(context);
      }
    });
  }
}
