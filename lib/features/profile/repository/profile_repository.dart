import 'package:chandrima_real_estate/data/api/api_client.dart';
import 'package:chandrima_real_estate/utils/app_constants.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileRepository{
  final ApiClient apiClient;
  ProfileRepository({required this.apiClient});

  Future<Response> getProfileDetails() async {
    return await apiClient.getData(AppConstants.memberDetailsUri);
  }

  Future<Response> addFamilyMember({required Map<String, String> body, XFile? image}) async{
    return await apiClient.postMultipartData(AppConstants.addFamilyMember, body, [MultipartBody('photo', image)]);
  }

}