import 'package:chandrima_real_estate/common/widgets/custom_snackbar.dart';
import 'package:chandrima_real_estate/features/payment/controller/payment_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'package:chandrima_real_estate/features/payment/controller/payment_controller.dart';
class MakePaymentScreen extends StatefulWidget {
    MakePaymentScreen({super.key,required this.paymentId});

  String paymentId;

  @override
  State<MakePaymentScreen> createState() => _MakePaymentScreenState();
}

class _MakePaymentScreenState extends State<MakePaymentScreen> {



    @override
  void initState() {
    // TODO: implement initState
      print("Starttt");
      Get.find<PaymentController>().makePayment(paymentId: widget.paymentId).toString();

      super.initState();
  }


    //WebViewController ?controller ;

  @override
  Widget build(BuildContext context) {
    if (Get.find<PaymentController>().paymentUrl=="") {
      return Scaffold(
        appBar: AppBar(title: Text('Loading Payment')),
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text('SSLCOMMERZ Payment')),
      body:   WebViewWidget(controller:  WebViewController(

      )
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..setNavigationDelegate(
          NavigationDelegate(
            onProgress: (int progress) {
              // Update loading bar.
            },
            onPageStarted: (String url) {},
            onPageFinished: (String url) {},
            onHttpError: (HttpResponseError error) {},
            onWebResourceError: (WebResourceError error) {},
            onNavigationRequest:  (NavigationRequest request) {
              if (request.url.contains('/payment/success')) {
                showCustomSnackBar("Payment Success");
                Get.back();
              } else if (request.url.contains('/payment/fail') ||
                  request.url.contains('/payment/cancel')) {
                showCustomSnackBar("Payment Failed");
                Get.back();
              }
              return NavigationDecision.navigate;
            },
          ),
        )
        ..loadRequest(Uri.parse(Get.find<PaymentController>().paymentUrl),

        )),
    );
  }
}