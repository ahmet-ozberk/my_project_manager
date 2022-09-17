import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:grock/grock.dart';
import 'package:lottie/lottie.dart';
import 'package:my_project_manager/assets.dart';
import 'package:my_project_manager/constant/app_color.dart';

class SigninRoleView extends StatelessWidget {
  const SigninRoleView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ClipPath(
            clipper: WaveClipperTwo(),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.5,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [
                    AppColor.submain,
                    AppColor.main,
                  ],
                ),
              ),
              child: Align(
                child: Container(
                  child: Lottie.asset(Assets.lottie.lottieSigninRoleJSON),
                ),
              ),
            ).animatedRotation(),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text("Please choose a login option",
                style: CupertinoTheme.of(context)
                    .textTheme
                    .navLargeTitleTextStyle
                    .copyWith(
                        fontWeight: FontWeight.w800, color: Colors.black)),
          ),
          Padding(
            padding: 20.horizontalP,
            child: Row(
              children: [
                Expanded(
                  flex: 7,
                  child: Container(
                    padding: 10.allP,
                    height: MediaQuery.of(context).size.height * 0.2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          CupertinoIcons.person_2_square_stack_fill,
                          size: 55,
                          color: Colors.green.shade700,
                        ),
                        GrockContainer(
                          onTap: () => _loginPopup(context),
                          padding: [5, 12].horizontalAndVerticalP,
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                            borderRadius: 25.allBR,
                            color: Colors.green.shade700,
                          ),
                          alignment: Alignment.center,
                          child: const Text(
                            "corporate",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ).rotate(value: -0.02).rotate(value: 0.02),
                ),
                const Spacer(),
                Expanded(
                  flex: 7,
                  child: Container(
                    padding: 10.allP,
                    height: MediaQuery.of(context).size.height * 0.2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          CupertinoIcons.person_crop_square_fill,
                          size: 55,
                          color: Colors.blue.shade700,
                        ),
                        GrockContainer(
                          padding: [5, 12].horizontalAndVerticalP,
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                            borderRadius: 25.allBR,
                            color: Colors.blue.shade700,
                          ),
                          alignment: Alignment.center,
                          child: const Text(
                            "personal",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ).rotate(value: -0.02).rotate(value: 0.02),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _loginPopup(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return GrockFadeAnimation(
          position: Position.bottom,
          child: Material(
            type: MaterialType.transparency,
            child: Padding(
              padding: MediaQuery.of(context).viewInsets,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  GrockGlassMorphism(
                    opacity: 0.85,
                    borderRadius: 3,
                    child: Container(
                      padding: [20,(Grock.width * 0.15).toInt(),20,20].paddingLTRB,
                      height: MediaQuery.of(context).size.height * 0.5,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            TextField(),
                            10.height,
                            TextField(),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: -Grock.width * 0.15,
                    left: 12,
                    child: Container(
                      width: Grock.width * 0.3,
                      height: Grock.width * 0.3,
                      padding: 10.allP,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              spreadRadius: 0,
                              blurRadius: 10,
                              offset: Offset(0, 10),
                            ),
                          ]),
                      child: Lottie.asset(Assets.lottie.lottieLoginJSON),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      backgroundColor: Colors.transparent,
    );
  }
}
