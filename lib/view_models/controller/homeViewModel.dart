import 'package:barber_app/view/appointmentView/appointmentView.dart';
import 'package:barber_app/view/dashboardView/dashboardView.dart';
import 'package:barber_app/view/newsView/newsView.dart';
import 'package:barber_app/view/profileView/profileView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController {
  RxInt currentTab = 0.obs;
  RxList<Widget> screens = [
    const DashboardView(),
    const AppointmentView(),
    const NewsfeedView(),
    const ProfileView(),
  ].obs;
  Widget currentScreen = const DashboardView();
  void changeTab(String screenName) {
    if (screenName == 'Home') {
      currentScreen = const DashboardView();
      currentTab.value = 0;
    } else if (screenName == 'Appointment') {
      currentScreen = const AppointmentView();
      currentTab.value = 1;
    } else if (screenName == 'News Feed') {
      currentScreen = const NewsfeedView();
      currentTab.value = 2;
    } else if (screenName == 'Profile') {
      currentScreen = const ProfileView();
      currentTab.value = 3;
    }
  }
}
