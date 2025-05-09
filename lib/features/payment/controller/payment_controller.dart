
import 'dart:convert';

import 'package:chandrima_real_estate/common/widgets/custom_snackbar.dart';
import 'package:chandrima_real_estate/data/api/api_checker.dart';
import 'package:chandrima_real_estate/features/payment/repository/payment_repository.dart';
import 'package:get/get.dart';


class PaymentController extends GetxController implements GetxService {
  final PaymentRepository paymentRepository;
  PaymentController({required this.paymentRepository});

  bool _isLoading = false;
  bool get isLoading => _isLoading;


   String _paymentUrl="";
  String get paymentUrl=>_paymentUrl;


  Future<void> makePayment({String ?paymentId}) async{
    _isLoading = true;
    update();
    Response response = await paymentRepository.makePayment(paymentId: paymentId.toString());
    if(response.statusCode == 200 && response.body["status"]=="success"){
       _isLoading=false;
       final jsonData = response.body["data"];
       print("wwwwwwwww$jsonData");
       _paymentUrl=jsonData;
       print("Payment Url issss$_paymentUrl");
       update();
     }else{
      showCustomSnackBar("Failed,Please try again");
      ApiChecker.checkApi(response);
    }

    _isLoading = false;
    update();

  }


}