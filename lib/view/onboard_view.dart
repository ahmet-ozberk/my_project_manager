// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grock/grock.dart';
import 'package:lottie/lottie.dart';
import 'package:my_project_manager/assets.dart';
import 'package:my_project_manager/controller/onboarding_controller.dart';
import 'package:my_project_manager/models/onboarding_model.dart';

class OnboardView extends ConsumerStatefulWidget {
  const OnboardView({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _OnboardViewState();
}

class _OnboardViewState extends ConsumerState<OnboardView> {
  @override
  Widget build(BuildContext context) {
    final read = ref.read(onboardingController);
    final watch = ref.watch(onboardingController);
    return Scaffold(
        backgroundColor: Colors.grey.shade100,
        body: SizedBox.expand(
          child: Stack(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.8,
                child: PageView.builder(
                  physics: const ClampingScrollPhysics(),
                  itemCount: read.onboardingList.length,
                  controller: read.pageController,
                  onPageChanged: (value) => read.setCurrentPage(value),
                  itemBuilder: (context, index) {
                    final OnboardingModel _item = read.onboardingList[index];
                    return SafeArea(
                      bottom: false,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Lottie.asset(
                              _item.image,
                              height:
                                  MediaQuery.of(context).size.height * 0.4,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).size.height * 0.16,
                                left: 30,
                                right: 30),
                            child: Column(
                              children: [
                                Text(
                                  _item.title,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline4!
                                      .copyWith(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w800,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: ClipPath(
                  clipper: WaveClipperOne(reverse: true),
                  child: Container(
                    padding: EdgeInsets.only(
                        bottom: context.bottom, left: 30, right: 20, top: 40),
                    height: MediaQuery.of(context).size.height * 0.35,
                    color: Colors.deepPurple,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          watch.onboardingList[watch.currentPage].description,
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                        GrockFadeAnimation(
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text.rich(
                                  TextSpan(
                                    text: '${watch.currentPage + 1}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w900,
                                          fontSize: 22,
                                        ),
                                    children: [
                                      TextSpan(
                                        text: '/${read.onboardingList.length}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium!
                                            .copyWith(
                                              color: Colors.grey.shade400,
                                              fontSize: 34,
                                              fontWeight: FontWeight.w400,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                GrockContainer(
                                  onTap: () => read.nextPage(),
                                  isTapAnimation: false,
                                  padding: [10, 0].horizontalAndVerticalP,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: 25.borderRadius,
                                  ),
                                  child: AnimatedCrossFade(
                                    firstChild: Lottie.asset(
                                        Assets.lottie.lottieOnboardNextJSON,
                                        width: 55),
                                    secondChild: Lottie.asset(
                                        Assets.lottie.lottieOnboardCompleteJSON,
                                        width: 55),
                                    crossFadeState: watch.currentPage ==
                                            read.onboardingList.length - 1
                                        ? CrossFadeState.showSecond
                                        : CrossFadeState.showFirst,
                                    duration: const Duration(milliseconds: 500),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
