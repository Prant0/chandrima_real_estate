import 'package:get/get.dart';
import 'package:chandrima_real_estate/features/auth/repository/auth_repository.dart';

class AuthController extends GetxController implements GetxService {
  final AuthRepository authRepository;
  AuthController({required this.authRepository});

  bool _isLoading = false;
  bool get isLoading => _isLoading;

 /* Future<void> login({required String email, required String password}) async {
    _isLoading = true;
    update();

    Map<String, dynamic> data = {
      "username": email,
      "password": password,
    };

    Response response = await authRepository.login(data);
    if(response.statusCode == 200) {
      final token = response.body['access'];
      await authRepository.saveUserToken(token);
      Get.offAll(() => const DashboardScreen(pageIndex: 0));
    } else {
      ApiChecker.checkApi(response);
    }
    _isLoading = false;
    update();
  }

  Future<void> register({required String email, required String password}) async {
    _isLoading = true;
    update();

    Map<String, dynamic> data = {
      "username": email,
      "password": password,
    };

    Response response = await authRepository.register(data);
    if(response.statusCode == 200) {
      final token = response.body['access'];
      await authRepository.saveUserToken(token);
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

  Future<void> removeToken() async {
    await authRepository.removeToken();
  }

  */




}