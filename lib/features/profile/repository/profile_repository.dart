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


  Future<Response> getUserInvoiceList() async {
    return await apiClient.getData(AppConstants.userInvoiceList);
  }

  Future<Response> addFamilyMember({required Map<String, String> body, XFile? image}) async{
    return await apiClient.postMultipartData(AppConstants.addFamilyMember, body, [MultipartBody('photo', image)]);
  }

  Future<Response> addTenantMember({required Map<String, String> body, XFile? photo,nidFront,nidRare}) async{
    return await apiClient.postMultipartData(AppConstants.addTenantMember, body,
      [
        MultipartBody('photo', photo),
        MultipartBody('nid_image', nidFront),
        MultipartBody('nid_image', nidRare),
      ],);
  }
}