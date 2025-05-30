import 'package:chandrima_real_estate/features/auth/controller/auth_controller.dart';
import 'package:chandrima_real_estate/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';


class RefundPolicy extends StatefulWidget {
  const RefundPolicy({super.key});

  @override
  State<RefundPolicy> createState() => _RefundPolicyState();
}

class _RefundPolicyState extends State<RefundPolicy> {
  @override
  void initState() {
    // TODO: implement initState
    Get.find<AuthController>().getRefundPolicies();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      appBar: AppBar(
        title: const Text(' Refund Policy'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: GetBuilder<AuthController>(
            builder: (authController) {
              if (authController.isLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (authController.refundPolicy.isEmpty) {
                return const Center(child: Text('No Refund Policy Available'));
              } else {
                return Text("${htmlToString(authController.refundPolicy)}");
              }
            },
          ),
        ),
      ),
    );
  }
}
//