import 'package:chandrima_real_estate/data/api/api_client.dart';
import 'package:chandrima_real_estate/utils/app_constants.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ComplainRepository{
  final ApiClient apiClient;
  ComplainRepository({required this.apiClient});

  Future<Response> getComplainList({required int page}) async {
    return await apiClient.getData("${AppConstants.complainList}?page=$page");
  }

  Future<Response> getComplainCategory( ) async {
    return await apiClient.getData("${AppConstants.complainCategoryList}");
  }
  Future<Response> deleteComplain(String id) async {
    return await apiClient.getData("/complaint/delete/$id");
  }

  Future<Response> addComplain({required Map<String, String> body, List<XFile>? image}) async{


    List<MultipartBody> multipartImages = image?.map((img) => MultipartBody('documents[]', img))?.toList() ?? [];
    return await apiClient.postMultipartData(AppConstants.addComplain, body, multipartImages);


  }



}