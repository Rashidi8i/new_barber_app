// ignore_for_file: non_constant_identifier_names

import 'package:fluttertoast/fluttertoast.dart';
import 'package:barber_app/res/colors/app_color.dart';
import 'package:get/get.dart';

class Utils {
  static toastMessage(String message) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: AppColor.primaryColor,
      textColor: AppColor.goldenColor,
      gravity: ToastGravity.BOTTOM,
      toastLength: Toast.LENGTH_LONG,
    );
  }

  static snackBar(String title, String message) {
    Get.snackbar(
      title,
      message,
      backgroundColor: AppColor.whiteColor,
      colorText: AppColor.primaryColor,
    );
  }
}
