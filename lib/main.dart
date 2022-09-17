import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grock/grock.dart';
import 'package:my_project_manager/view/splash_view.dart';

void main() {
  runApp(const ProviderScope(child: MyProjectManager()));
}

class MyProjectManager extends StatelessWidget {
  const MyProjectManager({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: Grock.navigationKey,
      scaffoldMessengerKey: Grock.scaffoldMessengerKey,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: "Poppins",
      ),
      home: const SplashView(),
    );
  }
}
