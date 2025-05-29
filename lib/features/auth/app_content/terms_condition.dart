import 'package:chandrima_real_estate/features/auth/controller/auth_controller.dart';
import 'package:chandrima_real_estate/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';


class TermsCondition extends StatefulWidget {
  const TermsCondition({super.key});

  @override
  State<TermsCondition> createState() => _TermsConditionState();
}

class _TermsConditionState extends State<TermsCondition> {
  @override
  void initState() {
    // TODO: implement initState
    Get.find<AuthController>().getTermsAndCondition();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      appBar: AppBar(
        title: const Text('Terms & Conditions'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: GetBuilder<AuthController>(
            builder: (authController) {
              if (authController.isLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (authController.termsAndCondition.isEmpty) {
                return const Center(child: Text('No Terms & Conditions Available'));
              } else {
                return Text("${htmlToString(authController.termsAndCondition)}");
              }
            },
          ),
        ),
      ),
    );
  }
}
