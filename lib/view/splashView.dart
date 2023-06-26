import 'dart:async';

import 'package:barber_app/res/colors/app_color.dart';
import 'package:barber_app/view/homeView/homeView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        const Duration(seconds: 3600),
        () => Get.off(() => HomeView(),
            transition: Transition.rightToLeft,
            duration: const Duration(milliseconds: 450)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.secondaryColor,
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [
            Center(
              child: Image.asset(
                'assets/icons/SPicon.png',
                height: 161.27,
                width: 191.34,
              ),
            ),
            Positioned(
              bottom: 100,
              left: 0,
              right: 0,
              child: CustomProgressBar(
                totalValue: 80,
                value: 50,
                width: 113.w,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomProgressBar extends StatelessWidget {
  final double width;
  final int value;
  final int totalValue;

  const CustomProgressBar(
      {super.key,
      required this.width,
      required this.value,
      required this.totalValue});

  @override
  Widget build(BuildContext context) {
    double ratio = value / totalValue;
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Stack(
        children: [
          Container(
            width: width,
            height: 1,
            decoration: const BoxDecoration(color: AppColor.dark2Color),
          ),
          AnimatedContainer(
              height: 1,
              width: width - (width * ratio),
              duration: Duration(milliseconds: totalValue),
              decoration: BoxDecoration(
                  color: AppColor.primaryColor,
                  borderRadius: BorderRadius.circular(5))),
        ],
      )
    ]);
  }
}
