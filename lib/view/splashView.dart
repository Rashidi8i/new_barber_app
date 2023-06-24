import 'dart:async';

import 'package:barber_app/view/homeView/homeView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => Get.off(() => HomeView(),
            transition: Transition.rightToLeft,
            duration: const Duration(milliseconds: 450)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/icons/Frameappicon.png'),
            const Text('Barber App'),
          ],
        ),
      ),
    );
  }
}
