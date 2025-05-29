import 'package:chandrima_real_estate/features/auth/controller/auth_controller.dart';
import 'package:chandrima_real_estate/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';


class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  void initState() {
    // TODO: implement initState
    Get.find<AuthController>().getAboutUs();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: GetBuilder<AuthController>(
            builder: (authController) {
              if (authController.isLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (authController.aboutUs.isEmpty) {
                return const Center(child: Text('No About Us Available'));
              } else {
                return Text("${htmlToString(authController.aboutUs)}");
              }
            },
          ),
        ),
      ),
    );
  }
}
