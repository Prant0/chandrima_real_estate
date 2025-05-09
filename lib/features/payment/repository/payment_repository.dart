import 'package:get/get.dart';


import 'package:chandrima_real_estate/data/api/api_client.dart';
import 'package:chandrima_real_estate/utils/app_constants.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class PaymentRepository {
  final ApiClient apiClient;

  PaymentRepository({required this.apiClient});


  Future<Response> makePayment({required String paymentId}) async{
    return await apiClient.postData("${AppConstants.makePaymentUri}$paymentId",{});
  }

}