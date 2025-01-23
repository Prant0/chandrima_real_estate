import 'package:chandrima_real_estate/common/widgets/custom_snackbar.dart';
import 'package:chandrima_real_estate/common/widgets/custom_text_field.dart';
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

  final TextEditingController _phoneController = TextEditingController(text: '01723826340');
  final TextEditingController _passwordController = TextEditingController(text: "12345678");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(Dimensions.paddingSizeFifteen),
            child: GetBuilder<AuthController>(builder: (authController) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  SizedBox(height: constraints.maxHeight * 0.1),

                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(Dimensions.radiusFifteen),
                      child: Image.asset(Images.logo, height: 80),
                    ),
                  ),
                  const SizedBox(height: 20),

                  RichText(
                    text: TextSpan(
                      text: "Let's ",
                      style: poppinsRegular.copyWith(fontSize: Dimensions.fontSizeTwentySix, color: AppColors.black),
                      children: [
                        TextSpan(
                          text: 'Sign In',
                          style: poppinsRegular.copyWith(fontSize: Dimensions.fontSizeTwentySix, color: AppColors.primary),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),

                  Text(
                    'Sign in with the Chandrima Real Estate to explore our all services',
                    style: poppinsRegular.copyWith(color: AppColors.grey),
                  ),
                  SizedBox(height: constraints.maxHeight * 0.08),

                  CustomTextField(
                    controller: _phoneController,
                    hintText: 'Enter Your Phone Number',
                    prefixIcon: TablerIcons.phone,
                    inputType: TextInputType.phone,
                  ),
                  const SizedBox(height: 15),

                  CustomTextField(
                    controller: _passwordController,
                    hintText: 'Enter Your Password',
                    prefixIcon: TablerIcons.lock,
                    isPassword: true,
                    inputAction: TextInputAction.done,
                  ),
                  SizedBox(height: constraints.maxHeight * 0.1),

                  CustomButton(
                    buttonText: 'Sign In',
                    isLoading: authController.isLoading,
                    onPressed: () {
                      String phone = _phoneController.text;
                      String password = _passwordController.text;

                      if (phone.isEmpty) {
                        showCustomSnackBar('Please enter your phone number');
                      }else if (!RegExp(r'^01[3-9]\d{8}$').hasMatch(phone)) {
                        showCustomSnackBar('Please enter a valid phone number');
                      }else if (password.isEmpty) {
                        showCustomSnackBar('Please enter your password');
                      }else if (password.length < 6) {
                        showCustomSnackBar('Password must be at least 6 characters');
                      }else {
                        authController.login(phone: phone, password: password);
                      }
                    },
                  ),
                  const SizedBox(height: 10),

                  Center(
                    child: TextButton(
                      onPressed: () {

                      },
                      child: Text(
                        'Forgot Password?',
                        style: poppinsRegular.copyWith(color: AppColors.primary),
                      ),
                    ),
                  ),
                ],
              );
            }),
          );
        }
      ),
    );
  }
}