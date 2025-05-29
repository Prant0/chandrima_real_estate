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

  Future<Response> getNotificationList({required int page}) async {
    return await apiClient.getData("${AppConstants.notificationsList}?page=$page");
  }

  Future<Response> getMyAdvertiseList({required int page}) async {
    return await apiClient.getData("${AppConstants.myAdvertisementList}?page=$page");
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

  Future<Response> addAdvertise({required Map<String, String> body, XFile? image,paymentDocument,video}) async{
    return await apiClient.postMultipartData(AppConstants.addAdvertise, body, [MultipartBody('image', image),MultipartBody('payment_documents[]', paymentDocument),MultipartBody('video', video)]);
  }

  Future<Response> updateAdvertise({required Map<String, String> body, XFile? image,video}) async{
    return await apiClient.postMultipartData(AppConstants.updateAdvertise, body, [MultipartBody('image', image),MultipartBody('video', video)]);
  }

  Future<Response> getAdvertiseNotificationDetails(String uri) async {
    return await apiClient.getData(uri);
  }
  Future<Response> getAdvertiseSettings() async {
    return await apiClient.getData(AppConstants.advertiseSettings);
  }

  Future<Response> getServiceChargeNotificationDetails(String uri)async {
    return await apiClient.getData(uri);
  }
  Future<Response> deleteAdvertise({required int id}) async {
    return await apiClient.getData('${AppConstants.deleteAdvertise}/$id');
  }
}