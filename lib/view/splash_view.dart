import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grock/grock.dart';
import 'package:lottie/lottie.dart';
import 'package:my_project_manager/assets.dart';
import 'package:my_project_manager/view/onboard_view.dart';

class SplashView extends ConsumerStatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashViewState();
}

class _SplashViewState extends ConsumerState<SplashView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) => _init());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset(
          Assets.lottie.lottieSplashJSON,
          width: MediaQuery.of(context).size.width * 0.7,
        ).animatedRotation(),
      ),
    );
  }

  _init() {
    Future.delayed(const Duration(milliseconds: 2600), () {
      Grock.toRemove(const OnboardView(), type: NavType.fade);
    });
  }
}
