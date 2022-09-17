import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grock/grock.dart';
import 'package:my_project_manager/assets.dart';
import 'package:my_project_manager/models/onboarding_model.dart';
import 'package:my_project_manager/view/login_view.dart';
import 'package:my_project_manager/view/signin_role_view.dart';

final onboardingController = ChangeNotifierProvider((ref) => OnboardingController());

class OnboardingController extends ChangeNotifier {
  final List<OnboardingModel> _onboardingList = [
    OnboardingModel(
      title: "Welcome to My Project Manager",
      description:
          "My Project Manager is a project management app that helps you to manage your projects easily.",
      image: Assets.lottie.lottieOnboardOneJSON,
    ),
    OnboardingModel(
      title: "Create your project",
      description:
          "Create your project and add your team members to start working on your project.",
      image: Assets.lottie.lottieOnboardTwoJSON,
    ),
    OnboardingModel(
      title: "Manage your project",
      description:
          "Manage your project and track your project progress easily.",
      image: Assets.lottie.lottieOnboardThreeJSON,
    ),
  ];

  List<OnboardingModel> get onboardingList => _onboardingList;

  final pageController = PageController();

  int _currentPage = 0;

  int get currentPage => _currentPage;

  void setCurrentPage(int index) {
    _currentPage = index;
    notifyListeners();
  }

  void nextPage() {
    if (_currentPage < _onboardingList.length - 1) {
      _currentPage++;
      pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
      notifyListeners();
    }else{
      Grock.toRemove(const SigninRoleView(),type: NavType.fade);
    }
  }
}