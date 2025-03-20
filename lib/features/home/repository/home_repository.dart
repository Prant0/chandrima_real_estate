import 'package:chandrima_real_estate/data/api/api_client.dart';
import 'package:chandrima_real_estate/utils/app_constants.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class HomeRepository {
  final ApiClient apiClient;
  HomeRepository({required this.apiClient});

  Future<Response> getAdvertisesList() async {
    return await apiClient.getData(AppConstants.advertisementList);
  }

  Future<Response> getNotificationList() async {
    return await apiClient.getData(AppConstants.notificationsList);
  }

  Future<Response> getNotificationCount() async {
    return await apiClient.getData(AppConstants.notificationsCount);
  }

  Future<Response> getHelpLine() async {
    return await apiClient.getData(AppConstants.helpLineUrl);
  }

  Future<Response> getAdvertiseDetails(int id) async {
    return await apiClient.getData('${AppConstants.advertisementDetails}/$id');
  }

  Future<Response> addAdvertise({required Map<String, String> body, XFile? image,video}) async{
    return await apiClient.postMultipartData(AppConstants.addAdvertise, body, [MultipartBody('image', image),MultipartBody('video', video)]);
  }

}