import 'dart:convert';

import 'package:chandrima_real_estate/common/widgets/custom_snackbar.dart';
import 'package:chandrima_real_estate/data/api/api_checker.dart';
import 'package:chandrima_real_estate/features/auth/screens/otp_screen.dart';
import 'package:chandrima_real_estate/features/dashboard/screens/dashboard_screen.dart';
import 'package:chandrima_real_estate/features/profile/controller/profile_controller.dart';
import 'package:chandrima_real_estate/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:chandrima_real_estate/features/auth/repository/auth_repository.dart';

class AuthController extends GetxController implements GetxService {
  final AuthRepository authRepository;
  AuthController({required this.authRepository});

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> login({required String phone, required String password}) async {
    _isLoading = true;
    update();

    Map<String, dynamic> data = {
      "mobile": phone,
      "otp_code": password,
    };

    Response response = await authRepository.login(data);
    if(response.statusCode == 200 &&  response.body['token'] !=null) {
      final token = response.body['token'];
      await authRepository.saveUserToken(token);
      Get.find<ProfileController>().getProfileDetails();
      _otpController.clear();
      Get.offAll(() =>   DashboardScreen(pageIndex: 0,profilePageIndex: 0));
    } else {
     // ApiChecker.checkApi(response);
   showCustomSnackBar("Invalid OTP");
    }
    _isLoading = false;
    update();
  }

  bool isLoggedIn() {
    return authRepository.isLoggedIn();
  }

  Future<void> logout() async {
    _isLoading = true;
    update();

    Response response = await authRepository.logout();
    if(response.statusCode == 200) {
      await removeToken();
      Get.offAllNamed(RoutesName.getLoginScreen());
    } else {
      ApiChecker.checkApi(response);
    }
    _isLoading = false;
    update();
  }

  Future<void> removeToken() async {
    await authRepository.removeToken();
    Get.offAllNamed(RoutesName.getLoginScreen());
  }


  final TextEditingController _otpController = TextEditingController();
  TextEditingController get otpController => _otpController;

  final TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController get phoneNumberController => _phoneNumberController;


  bool isSuccess = false;

  Future<bool> sendOtp({String ?phoneNumber}) async {
    _isLoading = true;
    update();
    Map<String, String?> data ={
      "mobile": "$phoneNumber",
    };
    dynamic response = await authRepository.sendOtp(data);

    _isLoading = false;update();
    print("wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww${response.statusCode}");
    if(response.statusCode == 200 && response.body["status"]==true) {
      isSuccess = true;
     // otpController.text=response.body["test_code"].toString();
      showCustomSnackBar("success otp send to your phone number", isError: false);
      Get.to(VerifyOtpScreen());
    }
    else {
       isSuccess = false;
      showCustomSnackBar("${response.body["message"]}", isError: true);
      ApiChecker.checkApi(response);
    }
    update();
    return isSuccess;
  }


}