import 'package:chandrima_real_estate/data/api/api_client.dart';
import 'package:chandrima_real_estate/utils/app_constants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepository {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;
  AuthRepository({required this.apiClient, required this.sharedPreferences});

  Future<Response> login(Map<String, dynamic> data) async {
    return apiClient.postData(AppConstants.loginUri, data);
  }

  Future<Response> sendOtp(Map<String, dynamic> data) async {
    return apiClient.postData(AppConstants.sendOtpUrl, data);
  }

  Future<bool> saveUserToken(String token) async {
    apiClient.token = token;
    apiClient.updateHeader(token);
    return await sharedPreferences.setString(AppConstants.token, token);
  }

  bool isLoggedIn() {
    return sharedPreferences.containsKey(AppConstants.token);
  }

  Future<Response> logout() async {
    return apiClient.getData(AppConstants.logoutUri);
  }

  Future<void> removeToken() async {
    await sharedPreferences.remove(AppConstants.token);
    apiClient.token = '';
  }

  Future<Response> getPrivacyPolicy() async {
    return apiClient.getData(AppConstants.privacyPolicyUri);
  }

  Future<Response> getRefundPolicy() async {
    return apiClient.getData(AppConstants.refundPolicyUri);
  }

  Future<Response> getAboutUs() async {
    return apiClient.getData(AppConstants.aboutUsUri);
  }

  Future<Response> getTermsCondition() async {
    return apiClient.getData(AppConstants.termsConditionUri);
  }

}