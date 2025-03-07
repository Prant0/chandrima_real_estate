import 'package:chandrima_real_estate/data/api/api_client.dart';
import 'package:chandrima_real_estate/utils/app_constants.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class GatePassRepository {
  final ApiClient apiClient;
  const GatePassRepository({required this.apiClient});

  Future<Response> getGatePassList() async {
    return await apiClient.getData(AppConstants.gatePassList);
  }


  Future<Response> getGatePassType() async {
    return await apiClient.getData(AppConstants.gatePassType);
  }

  Future<Response> addGatePass(Map<String, String> data, List<XFile>? image) async {

    List<MultipartBody> paymentDocument = image?.map((img) => MultipartBody('payment_documents[]', img))?.toList() ?? [];
    return await apiClient.postMultipartData(AppConstants.addGatePass, data, paymentDocument);
  }

  Future<Response> deleteGatePass({required int gatePassId}) async {
    return await apiClient.getData('${AppConstants.deleteGatePass}/$gatePassId');
  }

  Future<Response> downloadGatePass({required int gatePassId}) async {
    return await apiClient.getData('${AppConstants.gatePassDownload}/$gatePassId');
  }

}