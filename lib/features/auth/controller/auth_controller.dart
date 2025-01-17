import 'package:chandrima_real_estate/data/api/api_checker.dart';
import 'package:chandrima_real_estate/features/dashboard/screens/dashboard_screen.dart';
import 'package:chandrima_real_estate/features/profile/controller/profile_controller.dart';
import 'package:chandrima_real_estate/routes/routes_name.dart';
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
      "password": password,
    };

    Response response = await authRepository.login(data);
    if(response.statusCode == 200) {
      final token = response.body['token'];
      await authRepository.saveUserToken(token);
      Get.find<ProfileController>().getProfileDetails();
      Get.offAll(() => const DashboardScreen(pageIndex: 0));
    } else {
      ApiChecker.checkApi(response);
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

}