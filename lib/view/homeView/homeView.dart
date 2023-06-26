// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api

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
      bottomNavigationBar: BottomAppBar(
        color: AppColor.cardBGColor,
        child: SizedBox(
          height: 84.h,
          width: 375.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              SizedBox(
                width: 160.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    MaterialButton(
                        minWidth: 35,
                        onPressed: () {
                          homeController.changeTab('Home');
                        },
                        child: Column(
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
                        )),
                    MaterialButton(
                        minWidth: 35,
                        onPressed: () {
                          homeController.changeTab('Appointment');
                        },
                        child: Obx(() {
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
                    MaterialButton(
                        minWidth: 35,
                        onPressed: () {
                          homeController.changeTab('News Feed');
                        },
                        child: Obx(() {
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
                    MaterialButton(
                        minWidth: 35,
                        onPressed: () {
                          homeController.changeTab('Profile');
                        },
                        child: Obx(() {
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
      ),
    );
  }
}
