// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, camel_case_types

import 'package:barber_app/res/colors/app_color.dart';
import 'package:barber_app/view_models/controller/homeViewModel.dart';
import 'package:flutter/material.dart';
import 'package:barber_app/view/dashboardView/dashboardView.dart';
import 'package:barber_app/view/appointmentView/appointmentView.dart';
import 'package:barber_app/view/newsView/newsView.dart';
import 'package:barber_app/view/profileView/profileView.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final List<Widget> screens = [
    const DashboardView(),
    const AppointmentView(),
    const NewsfeedView(),
    const ProfileView(),
  ];
  final PageStorageBucket bucket = PageStorageBucket();
  final homeController = Get.put(HomeViewModel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.secondaryColor,
      body: Obx(() {
        return PageStorage(
          bucket: bucket,
          child: homeController.screens[homeController.currentTab.value],
        );
      }),
      floatingActionButton: ClipOval(
        child: Material(
          color: AppColor.primaryColor,
          child: InkWell(
            onTap: () {},
            child: const SizedBox(
              width: 56,
              height: 56,
              child: Icon(
                Icons.add_rounded,
                color: AppColor.whiteColor,
                size: 40,
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: bottumBar(homeController: homeController),
    );
  }
}

class bottumBar extends StatelessWidget {
  const bottumBar({
    super.key,
    required this.homeController,
  });

  final HomeViewModel homeController;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 10,
      color: AppColor.cardBGColor,
      child: SizedBox(
        height: 84.h,
        width: 375.w,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(
              width: 160.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  InkWell(onTap: () {
                    homeController.changeTab('Home');
                  }, child: Obx(() {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        ImageIcon(
                          const AssetImage('assets/icons/home (2).png'),
                          color: homeController.currentTab.value == 0
                              ? AppColor.primaryColor
                              : AppColor.dark3Color,
                        ),
                        Text(
                          'Home',
                          style: TextStyle(
                            fontFamily: 'gordita',
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: homeController.currentTab.value == 0
                                ? AppColor.primaryColor
                                : AppColor.dark3Color,
                          ),
                        ),
                      ],
                    );
                  })),
                  InkWell(onTap: () {
                    homeController.changeTab('Appointment');
                  }, child: Obx(() {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        ImageIcon(
                          const AssetImage('assets/icons/Calendar.png'),
                          color: homeController.currentTab.value == 1
                              ? AppColor.primaryColor
                              : AppColor.dark3Color,
                        ),
                        Text(
                          'Appointment',
                          style: TextStyle(
                            fontFamily: 'gordita',
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: homeController.currentTab.value == 1
                                ? AppColor.primaryColor
                                : AppColor.dark3Color,
                          ),
                        ),
                      ],
                    );
                  })),
                ],
              ),
            ),
            SizedBox(
              width: 160.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  InkWell(onTap: () {
                    homeController.changeTab('News Feed');
                  }, child: Obx(() {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        ImageIcon(
                          const AssetImage('assets/icons/Document.png'),
                          color: homeController.currentTab.value == 2
                              ? AppColor.primaryColor
                              : AppColor.dark3Color,
                        ),
                        Text(
                          'News Feed',
                          style: TextStyle(
                            fontFamily: 'gordita',
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: homeController.currentTab.value == 2
                                ? AppColor.primaryColor
                                : AppColor.dark3Color,
                          ),
                        ),
                      ],
                    );
                  })),
                  InkWell(onTap: () {
                    homeController.changeTab('Profile');
                  }, child: Obx(() {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        ImageIcon(
                          const AssetImage('assets/icons/profie.png'),
                          color: homeController.currentTab.value == 3
                              ? AppColor.primaryColor
                              : AppColor.dark3Color,
                        ),
                        Text(
                          'Profile',
                          style: TextStyle(
                            fontFamily: 'gordita',
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: homeController.currentTab.value == 3
                                ? AppColor.primaryColor
                                : AppColor.dark3Color,
                          ),
                        ),
                      ],
                    );
                  })),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BNBCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = const Color.fromARGB(255, 219, 14, 14)
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(0, 20); // Start
    path.quadraticBezierTo(size.width * 0.20, 0, size.width * 0.35, 0);
    path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 20);
    path.arcToPoint(Offset(size.width * 0.60, 20),
        radius: const Radius.circular(20.0), clockwise: false);
    path.quadraticBezierTo(size.width * 0.60, 0, size.width * 0.65, 0);
    path.quadraticBezierTo(size.width * 0.80, 0, size.width, 20);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 20);
    canvas.drawShadow(path, Colors.black, 5, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
