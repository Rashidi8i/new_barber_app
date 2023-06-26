import 'package:get/get.dart';

class SplashController extends GetxController {
  RxInt totalvalue = 3.obs;
  RxInt value = 0.obs;
  RxInt addVaue() {
    value++;
    return value;
  }
}
