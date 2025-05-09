import 'package:chandrima_real_estate/common/widgets/custom_app_bar.dart';
import 'package:chandrima_real_estate/common/widgets/custom_button.dart';
import 'package:chandrima_real_estate/features/dashboard/screens/dashboard_screen.dart';
import 'package:chandrima_real_estate/features/profile/controller/profile_controller.dart';
import 'package:chandrima_real_estate/utils/dimensions.dart';
import 'package:chandrima_real_estate/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentSuccessScreen extends StatefulWidget {
  final bool isSuccess;
  const PaymentSuccessScreen({super.key, required this.isSuccess});

  @override
  State<PaymentSuccessScreen> createState() => _PaymentSuccessScreenState();
}

class _PaymentSuccessScreenState extends State<PaymentSuccessScreen> {

  @override
  void initState() {
    super.initState();

    if(widget.isSuccess) {
      Get.find<ProfileController>().getUserInvoiceList(page: 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        Get.offAll(() => const DashboardScreen(pageIndex: 0, profilePageIndex: 0));
      },
      child: Scaffold(
        appBar: CustomAppBar(title: widget.isSuccess ? 'Payment Success' : 'Payment Failed'),

        body: Padding(
          padding: const EdgeInsets.all(Dimensions.paddingSizeTwenty),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  widget.isSuccess ? Icons.check_circle : Icons.error,
                  color: widget.isSuccess ? Colors.green : Colors.red,
                  size: 100,
                ),
                const SizedBox(height: 20),

                Text(
                  widget.isSuccess ? 'Payment was successful!' : 'Payment failed. Please try again.',
                  style: poppinsMedium.copyWith(
                    fontSize: 18,
                    color: widget.isSuccess ? Colors.green : Colors.red,
                  ),
                ),
                const SizedBox(height: 20),

                CustomButton(
                  buttonText: 'Go to Home',
                  onPressed: () {
                    Get.offAll(() => const DashboardScreen(pageIndex: 0, profilePageIndex: 0));
                  },
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
