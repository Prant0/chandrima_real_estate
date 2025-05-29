import 'package:chandrima_real_estate/common/widgets/custom_snackbar.dart';
import 'package:chandrima_real_estate/data/api/api_checker.dart';
import 'package:chandrima_real_estate/features/advertise/model/advertise_notification.dart';
import 'package:chandrima_real_estate/features/advertise/model/advertises_list_model.dart';
import 'package:chandrima_real_estate/features/advertise/model/my_advertise_model.dart';
import 'package:chandrima_real_estate/features/home/model/advertise_settings_model.dart';
 import 'package:chandrima_real_estate/features/home/model/help_line_model.dart';
import 'package:chandrima_real_estate/features/home/model/notification_model.dart';
import 'package:chandrima_real_estate/features/payment/controller/payment_controller.dart';
import 'package:flutter/material.dart';
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

  int? _notificationCount;
  int? get notificationCount => _notificationCount;

  AdvertiseNotification? _advertiseNotification;
  AdvertiseNotification? get advertiseNotification => _advertiseNotification;

  Future<void> getAdvertisesList() async {
    Response response = await homeRepository.getAdvertisesList();
    if (response.statusCode == 200) {
      _advertisesList = AdvertisesListModel.fromJson(response.body);
    }else{
      ApiChecker.checkApi(response);
    }
    update();
  }


  List<MyAdvertiseModel>? _myAdvertiseModel= [];
  List<MyAdvertiseModel>? get myAdvertiseModel => _myAdvertiseModel;

  Future<void> getMyAdvertise({required int page}) async {
    _isLoading=true;
    update();
    Response response = await homeRepository.getMyAdvertiseList(page: page);
    print("My Advertise Response: ${response.body}");
    _isLoading=false;
    if (response.statusCode == 200) {
      if (response.body["data"]["data"].isNotEmpty) {
        _myAdvertiseModel?.addAll(response.body["data"]["data"].map<MyAdvertiseModel>((data) => MyAdvertiseModel.fromJson(data)).toList());
        update();
      } else {
        showCustomSnackBar("No Data Available", isError: false);
      }
      //_notificationModel = NotificationModel.fromJson(response.body);
    }else{
      ApiChecker.checkApi(response);
    }
    update();
  }

  void loadMoreAdvertise(int pageNo) {
    getMyAdvertise(page: pageNo);
  }


  Future<void> deleteAdvertise({required int id,int? index}) async {
    final response = await homeRepository.deleteAdvertise(id: id);
    if(response.statusCode == 200){
      showCustomSnackBar('Advertise deleted successfully', isError: false);
      _myAdvertiseModel!.removeAt(index!);
      update();
    }else{
      ApiChecker.checkApi(response);
    }
    update();
  }



  List<NotificationModel>? _notificationModel= [];
  List<NotificationModel>? get notificationModel => _notificationModel;

  Future<void> getNotification({required int page}) async {

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _isLoading=true;
      update(); // Ensure this is called after the build phase
    });
    Response response = await homeRepository.getNotificationList(page: page);
    print("Notification Response: ${response.body}");
    _isLoading=false;
    if (response.statusCode == 200) {
      if (response.body["data"]["data"].isNotEmpty) {
        _notificationModel?.addAll(response.body["data"]["data"].map<NotificationModel>((data) => NotificationModel.fromJson(data)).toList());
        update();
      } else {
        showCustomSnackBar("No Data Available", isError: false);
      }
      //_notificationModel = NotificationModel.fromJson(response.body);
    }else{
      ApiChecker.checkApi(response);
    }
    update();
  }

  void loadMore(int pageNo) {
    getNotification(page: pageNo);
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


  XFile? _pickedPaymentDocument;
  XFile? get pickedPaymentDocument => _pickedPaymentDocument;
  void pickPaymentDocumentImage() async {
    _pickedPaymentDocument = await ImagePicker().pickImage(source: ImageSource.gallery);
    update();
  }

  Future<void> updateAdvertise({required String title, required String description,required String ad_type,XFile ?video}) async{
    _isLoading = true;
    update();

    Map<String, String> body = {};
    body.addAll({
      'title' : title,
      'description' : description,
      'ad_type' : ad_type ?? '',
    });

    Response response = await homeRepository.updateAdvertise(body: body,image: _pickedFile,video: video);
    if(response.statusCode == 200){
      _pickedFile = null;

      update();
      Get.back();
      showCustomSnackBar('Advertise Request updated successfully', isError: false);
    }else{
      ApiChecker.checkApi(response);
    }

    _isLoading = false;
    update();
  }



  Future<bool> addAdvertise({required String title, required String description,paymentMethod,paymentDetails,startDate,endDate,required String ad_type,XFile ?video}) async{
    _isLoading = true;
    update();

    Map<String, String> body = {};
    body.addAll({
      'title' : title,
      'description' : description,
      'ad_type' : ad_type ?? '',
      'payment_method' : paymentMethod ?? '',
      'payment_details' : paymentDetails ?? '',
      'start_date' : startDate ?? '',
      'end_date' : endDate ?? '',
    });

    Response response = await homeRepository.addAdvertise(
        body: body, image: _pickedFile,video: video,paymentDocument: _pickedPaymentDocument);
    if(response.statusCode == 200){
      _pickedFile = null;
      _myAdvertiseModel=[];
      _pickedPaymentDocument = null;
      _isLoading = false;
      update();
      showCustomSnackBar('Advertise Request added successfully', isError: false);
      var data= response.body['data']["invoice_id"];

     Get.find<PaymentController>().makePayment(paymentId: data ,paymentFrom:  'advertise');

      //Get.back();
      return true;
    }else{

      _isLoading = false;
      update();

      ApiChecker.checkApi(response);
      return false;
    }

  }

  Future<void> getAdvertiseNotificationDetails(String uri) async {
    Response response = await homeRepository.getAdvertiseNotificationDetails(uri);
    if (response.statusCode == 200) {
      _advertiseNotification = AdvertiseNotification.fromJson(response.body);
    }else{
      ApiChecker.checkApi(response);
    }
    update();
  }

  AdvertiseSettingsModel ? _advertiseSettingsModel;
  AdvertiseSettingsModel ? get advertiseSettingsModel => _advertiseSettingsModel;

  Future<void> getAdvertiseSettings() async {
    Response response = await homeRepository.getAdvertiseSettings();
    if (response.statusCode == 200) {
      _advertiseSettingsModel = AdvertiseSettingsModel.fromJson(response.body);
    }else{
      ApiChecker.checkApi(response);
    }
    update();
  }

}


