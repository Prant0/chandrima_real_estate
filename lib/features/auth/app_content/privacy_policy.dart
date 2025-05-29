import 'package:chandrima_real_estate/features/auth/controller/auth_controller.dart';
import 'package:chandrima_real_estate/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({super.key});

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  @override
  void initState() {
    // TODO: implement initState
    Get.find<AuthController>().getPrivacyPolicies();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      appBar: AppBar(
        title: const Text('Privacy Policy'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: GetBuilder<AuthController>(
            builder: (authController) {
              if (authController.isLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (authController.privacyPolicy.isEmpty) {
                return const Center(child: Text('No Privacy Policies Available'));
              } else {
                return Text("${htmlToString(authController.privacyPolicy)}");
              }
            },
          ),
        ),
      ),
    );
  }
}
