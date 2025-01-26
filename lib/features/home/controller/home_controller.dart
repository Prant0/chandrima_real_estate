import 'package:chandrima_real_estate/data/api/api_checker.dart';
import 'package:chandrima_real_estate/features/home/model/advertises_list_model.dart';
import 'package:get/get.dart';
import 'package:chandrima_real_estate/features/home/repository/home_repository.dart';

class HomeController extends GetxController implements GetxService {
  final HomeRepository homeRepository;
  HomeController({required this.homeRepository});

  AdvertisesListModel? _advertisesList;
  AdvertisesListModel? get advertisesList => _advertisesList;

  Advertises? _advertisesDetails;
  Advertises? get advertisesDetails => _advertisesDetails;

  Future<void> getAdvertisesList() async {
    Response response = await homeRepository.getAdvertisesList();
    if (response.statusCode == 200) {
      _advertisesList = AdvertisesListModel.fromJson(response.body);
    }else{
      ApiChecker.checkApi(response);
    }
    update();
  }

  Future<void> getAdvertiseDetails(int id) async {
    Response response = await homeRepository.getAdvertiseDetails(id);
    if (response.statusCode == 200) {
      _advertisesDetails = Advertises.fromJson(response.body['data']);
    }else{
      ApiChecker.checkApi(response);
    }
    update();
  }

}