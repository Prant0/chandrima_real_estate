import 'package:chandrima_real_estate/data/api/api_checker.dart';
import 'package:chandrima_real_estate/features/payment/repository/payment_repository.dart';
import 'package:chandrima_real_estate/features/payment/screens/payment_screen.dart';
import 'package:chandrima_real_estate/features/payment/screens/payment_success_screen.dart';
import 'package:chandrima_real_estate/utils/app_constants.dart';
import 'package:get/get.dart';

class PaymentController extends GetxController implements GetxService {
  final PaymentRepository paymentRepository;
  PaymentController({required this.paymentRepository});

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _paymentUrl;
  String? get paymentUrl => _paymentUrl;

  Future<void> makePayment({required String paymentId}) async{
    _isLoading = true;
    update();

    Response response = await paymentRepository.makePayment(paymentId: paymentId);
    if(response.statusCode == 200 && response.body["status"]=="success"){
       _paymentUrl = response.body['data'];
       Get.to(() => PaymentScreen(redirectUrl: _paymentUrl!, paymentId: paymentId));
     }else{
      ApiChecker.checkApi(response);
    }

    _isLoading = false;
    update();
  }

  Future<bool> checkPayment({required String paymentId}) async{
    bool isSuccess = false;

    Response response = await paymentRepository.checkPayment(paymentId: paymentId);
    if(response.statusCode == 200 && response.body['status'] == true){
      isSuccess = true;
    }else {
      isSuccess = false;
    }
    update();
    return isSuccess;
  }

  Future<void> paymentRedirect({required String url, required bool canRedirect, required String paymentId, required Function onClose}) async {
    if(canRedirect) {
      bool isSuccess = url.startsWith('${AppConstants.baseUrl}/payment/success');
      bool isFailed = url.startsWith('${AppConstants.baseUrl}/payment/fail');
      bool isCancel = url.startsWith('${AppConstants.baseUrl}/payment/cancel');
      if (isSuccess || isFailed || isCancel) {
        canRedirect = false;
        onClose();
      }

      if (isSuccess) {
        checkPayment(paymentId: paymentId).then((success) {
          if (success) {
            Get.off(() => const PaymentSuccessScreen(isSuccess: true));
          } else {
            Get.off(() => const PaymentSuccessScreen(isSuccess: false));
          }
        });
      } else if((isFailed || isCancel)){
        Get.off(() => const PaymentSuccessScreen(isSuccess: false));
      }
    }
  }

}