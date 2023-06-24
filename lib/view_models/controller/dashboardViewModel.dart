// ignore_for_file: unused_field, no_leading_underscores_for_local_identifiers

import 'dart:io';

import 'package:barber_app/data/response/status.dart';
import 'package:barber_app/models/dashboard/dashboardModel.dart';
import 'package:barber_app/repository/dashboard_repository/dashboardRepository.dart';
import 'package:barber_app/utils/utils.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  final _api = DashboardRepository();
  final rxRequestStatus = Status.LOADING.obs;
  final dashboardData = dashboardModel().obs;

  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value;
  void setDashboardData(dashboardModel _value) => dashboardData.value = _value;

  void getDashboardData() {
    Map<String, String> headers = {
      'api-key': 'd6dcc1bf-1189-4713-acc4-bf1da722475d'
    };

    _api.dashboardApi(headers).then((value) {
      setRxRequestStatus(Status.COMPLETED);
      setDashboardData(value);
      if (Platform.isAndroid) {
        Utils.toastMessage('Data Loaded!');
      } else if (Platform.isIOS) {
        Utils.snackBar('Success', 'Data Loaded!');
      }
    }).onError((error, stackTrace) {
      setRxRequestStatus(Status.ERROR);
      if (Platform.isAndroid) {
        Utils.toastMessage(error.toString());
      } else if (Platform.isIOS) {
        Utils.snackBar('Error', error.toString());
      }
    });
  }
}
