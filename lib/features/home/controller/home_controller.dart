import 'package:chandrima_real_estate/common/widgets/custom_snackbar.dart';
import 'package:chandrima_real_estate/data/api/api_checker.dart';
import 'package:chandrima_real_estate/features/home/model/advertises_list_model.dart';
import 'package:chandrima_real_estate/features/home/model/heml_line_model.dart';
import 'package:chandrima_real_estate/features/home/model/notification_model.dart';
import 'package:get/get.dart';
import 'package:chandrima_real_estate/features/home/repository/home_repository.dart';
import 'package:image_picker/image_picker.dart';

class HomeController extends GetxController implements GetxService {
  final HomeRepository homeRepository;
  HomeController({required this.homeRepository});

  AdvertisesListModel? _advertisesList;
  AdvertisesListModel? get advertisesList => _advertisesList;

  Advertises? _advertisesDetails;
  Advertises? get advertisesDetails => _advertisesDetails;

  HelpLineModel? _helpLineModel;
  HelpLineModel? get helpLineModel => _helpLineModel;

  int ?_notificationCount;
  int ?get notificationCount => _notificationCount;

  Future<void> getAdvertisesList() async {
    Response response = await homeRepository.getAdvertisesList();
    if (response.statusCode == 200) {
      _advertisesList = AdvertisesListModel.fromJson(response.body);
    }else{
      ApiChecker.checkApi(response);
    }
    update();
  }

  NotificationModel? _notificationModel;
  NotificationModel? get notificationModel => _notificationModel;

  Future<void> getNotification() async {
    Response response = await homeRepository.getNotificationList();
    print("Notification Response: ${response.body}");
    if (response.statusCode == 200) {
      _notificationModel = NotificationModel.fromJson(response.body);
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


   Future<void> getNotificationCount() async {
    Response response = await homeRepository.getNotificationCount();
    if (response.statusCode == 200) {
      _notificationCount = response.body['data'];
      print("Notification Count: $_notificationCount");
    }else{
      ApiChecker.checkApi(response);
    }
    update();
  }

  Future<void> getHelpLine() async {
    Response response = await homeRepository.getHelpLine();
    if (response.statusCode == 200) {
      _helpLineModel = HelpLineModel.fromJson(response.body);
    }else{
      ApiChecker.checkApi(response);
    }
    update();
  }


  bool _isLoading = false;
  bool get isLoading => _isLoading;


  XFile? _pickedFile;
  XFile? get pickedFile => _pickedFile;
  void pickImage() async {
    _pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    update();
  }


  Future<void> addAdvertise({required String title, required String description,required String ad_type,XFile ?video}) async{
    _isLoading = true;
    update();

    Map<String, String> body = {};
    body.addAll({
      'title' : title,
      'description' : description,
      'ad_type' : ad_type ?? '',
    });

    Response response = await homeRepository.addAdvertise(
        body: body, image: _pickedFile,video: video);
    if(response.statusCode == 200){
      _pickedFile=null;
      update();
      Get.back();
      showCustomSnackBar('Advertise Request added successfully', isError: false);
    }else{
      ApiChecker.checkApi(response);
    }

    _isLoading = false;
    update();
  }



}