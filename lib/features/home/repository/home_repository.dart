import 'package:chandrima_real_estate/data/api/api_client.dart';
import 'package:chandrima_real_estate/utils/app_constants.dart';
import 'package:get/get.dart';

class HomeRepository {
  final ApiClient apiClient;
  HomeRepository({required this.apiClient});

  Future<Response> getAdvertisesList() async {
    return await apiClient.getData(AppConstants.advertisementList);
  }

  Future<Response> getNotificationList() async {
    return await apiClient.getData(AppConstants.notificationsList);
  }

  Future<Response> getAdvertiseDetails(int id) async {
    return await apiClient.getData('${AppConstants.advertisementDetails}/$id');
  }

}