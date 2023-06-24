import 'package:barber_app/data/network/network_api_services.dart';
import 'package:barber_app/res/app_url/app_urls.dart';
import 'package:barber_app/models/dashboard/dashboardModel.dart';

class DashboardRepository {
  final _apiServices = NetworkApiServices();
  Future<dashboardModel> dashboardApi(Map<String, String> headers) async {
    dynamic response =
        await _apiServices.getApi(AppUrl.dashboardEndpoint, headers);
    return dashboardModel.fromJson(response);
  }
}
