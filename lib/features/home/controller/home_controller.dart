import 'package:get/get.dart';
import 'package:chandrima_real_estate/features/home/repository/home_repository.dart';

class HomeController extends GetxController implements GetxService {
  final HomeRepository homeRepository;
  HomeController({required this.homeRepository});

}