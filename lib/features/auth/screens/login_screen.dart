import 'package:chandrima_real_estate/common/widgets/custom_snackbar.dart';
import 'package:chandrima_real_estate/common/widgets/custom_text_field.dart';
import 'package:chandrima_real_estate/features/auth/app_content/about_us.dart';
import 'package:chandrima_real_estate/features/auth/app_content/privacy_policy.dart';
import 'package:chandrima_real_estate/features/auth/app_content/refund_policy.dart';
import 'package:chandrima_real_estate/features/auth/app_content/terms_condition.dart';
import 'package:chandrima_real_estate/features/auth/controller/auth_controller.dart';
import 'package:chandrima_real_estate/utils/app_color.dart';
import 'package:chandrima_real_estate/utils/dimensions.dart';
import 'package:chandrima_real_estate/utils/images.dart';
import 'package:chandrima_real_estate/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:get/get.dart';
import 'package:chandrima_real_estate/common/widgets/custom_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<AuthController>(builder: (authController) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 50),
              height: MediaQuery.of(context).size.height * 0.18,
              alignment: Alignment.center,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(Images.logo, fit: BoxFit.cover),
              ),
            ),
            const SizedBox(height: 30),
            Center(
              child: RichText(
                text: TextSpan(
                  text: "Let's ",
                  style: poppinsMedium.copyWith(fontSize: Dimensions.fontSizeTwentySix, color: AppColors.black),
                  children: [
                    TextSpan(
                      text: 'Sign In',
                      style: poppinsMedium.copyWith(fontSize: Dimensions.fontSizeTwentySix, color: AppColors.primary),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Sign in with the Chandrima Model Town to explore our all services',
                style: poppinsRegular.copyWith(color: AppColors.grey),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CustomTextField(
                controller: authController.phoneNumberController,
                hintText: 'Email or Phone Number',
                prefixIcon: TablerIcons.phone,
               //inputType: TextInputType.number,
                inputAction: TextInputAction.done,
              ),
            ),
            const SizedBox(height: 15),
            SizedBox(height: 30),
            Center(
              child: CustomButton(
                width: 150,
                buttonText: 'Sign In',
                isLoading: authController.isLoading,
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  String phone = authController.phoneNumberController.text.toString();
                  if (phone.isEmpty) {
                    showCustomSnackBar('Please enter your phone number');
                  } else {
                    authController.sendOtp(phoneNumber: phone);
                  }
                },
              ),
            ),
            Spacer(),

            Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: Column(
                children: [
                  Center(
                    child: Text(
                      "All rights and reserved by : Chandrima Real Estate PVT.LTD",
                      style: poppinsRegular,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 20,),

                  Wrap(
                    spacing: 0,
                    runSpacing: 0,
                    direction: Axis.horizontal,
                    children: [
                      TextButton(

                          onPressed: (){
                            Get.to(PrivacyPolicy());

                          }, child: Text("Privacy Policy",style: poppinsMedium.copyWith(color: AppColors.primary),)),
                      TextButton(

                          onPressed: (){
                            Get.to(RefundPolicy());
                          }, child: Text("Refund Policy",style: poppinsMedium.copyWith(color: AppColors.primary),)),
                      TextButton(

                          onPressed: (){
                            Get.to(AboutUs());
                          }, child: Text(" About Us",style: poppinsMedium.copyWith(color: AppColors.primary),)),
                     TextButton(

                          onPressed: (){
                            Get.to(TermsCondition());
                          }, child: Text("Terms & Condition",style: poppinsMedium.copyWith(color: AppColors.primary),)),
                    ],
                  )
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}