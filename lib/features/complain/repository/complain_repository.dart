import 'package:chandrima_real_estate/data/api/api_client.dart';
import 'package:chandrima_real_estate/utils/app_constants.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ComplainRepository{
  final ApiClient apiClient;
  ComplainRepository({required this.apiClient});

  Future<Response> getComplainList() async {
    return await apiClient.getData(AppConstants.complainList);
  }

  Future<Response> addComplain({required Map<String, String> body, List<XFile>? image}) async{
    /*return await apiClient.postMultipartData(AppConstants.addFamilyMember, body,
        [MultipartBody('documents', image)]

    */

    List<MultipartBody> multipartImages = image?.map((img) => MultipartBody('documents', img))?.toList() ?? [];
    return await apiClient.postMultipartData(AppConstants.addComplain, body, multipartImages);


  }



}