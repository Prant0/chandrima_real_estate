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


  Future<Response> getUserInvoiceList({required int page}) async {
    return await apiClient.getData("${AppConstants.userInvoiceList}?page=$page");
  }

  Future<Response> addFamilyMember({required Map<String, String> body, XFile? image,nidFront,nidRare,documents1,documents2}) async{
    return await apiClient.postMultipartData(AppConstants.addFamilyMember, body, [
      MultipartBody('photo', image,),
      MultipartBody('nid_image', nidFront,),
      MultipartBody('photo', image,),
      MultipartBody('photo', image,),


    ]);
  }

  Future<Response> updateFamilyMember({required Map<String, String> body, XFile? image}) async{
    return await apiClient.postMultipartData(AppConstants.updateFamilyMember, body, [MultipartBody('photo', image)]);
  }

  Future<Response> requestFamilyIDCard({required Map<String, String> body,  }) async{
    return await apiClient.postData(AppConstants.requestFamilyIDCard, body, );
  }

  Future<Response> addTenantMember({required Map<String, String> body, XFile? photo,List<XFile> ?nidImages,XFile ?documents1,documents2}) async{
    List<MultipartBody> _nidImages = nidImages?.map((img) => MultipartBody('nid_image[]', img))?.toList() ?? [];
    return await apiClient.postMultipartData(AppConstants.addTenantMember, body,
      [
        MultipartBody('photo', photo),
        MultipartBody('document_file[0][]', documents1),
        MultipartBody('document_file[1][]', documents2),
        ..._nidImages,

      ],

    );
  }

  Future<Response> updateTenantMember({required Map<String, String> body, XFile? photo,List<XFile> ?nidImages}) async{
    return await apiClient.postMultipartData(AppConstants.updateTenantMember, body,
      [
        MultipartBody('photo', photo),
      ],);
  }

  Future<Response> downloadLandInfo() async {
    return await apiClient.getData(AppConstants.landInfoDownload);
  }

  Future<Response> downloadTenantInfo() async {
    return await apiClient.getData(AppConstants.tenantInfoDownload);
  }

  Future<Response> deleteFamilyMember({required int id}) async {
    return await apiClient.getData('${AppConstants.deleteFamilyMember}/$id');
  }
  
  Future<Response> deleteTenantMember({required int id}) async {
    return await apiClient.getData('${AppConstants.deleteTenantMember}/$id');
  }

}