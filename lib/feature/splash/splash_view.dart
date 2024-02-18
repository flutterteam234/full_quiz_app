import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_architecture/feature/splash/components/app_is_off_pop_up.dart';
import 'package:riverpod_architecture/feature/splash/components/force_update_pop_up.dart';
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
    ref.read(splashProvider.notifier).appInit(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    listenAndNavigate(splashProvider);
    final splashState = ref.watch(splashProvider);
    final splashNotifier = ref.read(splashProvider.notifier);

    return Scaffold(
        backgroundColor: ColorConstants.smootWhite.getColor,
        body: Center(
            child: Stack(
          alignment: Alignment.center,
          fit: StackFit.passthrough,
          children: [
            Padding(
              padding: context.padding.horizontalHigh,
              child: Image.asset(ImageConstants.appIcon.toIcon,
                  alignment: Alignment.center),
            ),
            Visibility(
              visible: splashState.isPass == false,
              child: const ForceUpdatePopUp(),
            ),
            Visibility(
              visible: splashState.status == false,
              child: AppIsOffPopUp(
                notifier: splashNotifier,
              ),
            ),
          ],
        )));
  }
}

mixin _SplashViewListenMixin on ConsumerState<SplashView> {
  void listenAndNavigate(
    StateNotifierProvider<SplashNotifier, SplashState> provider,
  ) {
    ref.listen<SplashState>(provider, (previous, next) {
      if (next.isLoading) {
      } else {
        if (next.status) {
          if (next.isPass) {
            AuthService().checkLoginStatus(context);
          }
        }
      }
    });
  }
}
