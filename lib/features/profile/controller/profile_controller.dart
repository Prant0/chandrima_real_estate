import 'dart:io';

import 'package:chandrima_real_estate/common/widgets/custom_snackbar.dart';
import 'package:chandrima_real_estate/data/api/api_checker.dart';
import 'package:chandrima_real_estate/features/home/model/event_model.dart';
import 'package:chandrima_real_estate/features/profile/models/UserInvoiceModel.dart';
import 'package:chandrima_real_estate/features/profile/models/profile_model.dart';
import 'package:chandrima_real_estate/features/profile/models/tenant_model.dart';
import 'package:chandrima_real_estate/features/profile/repository/profile_repository.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';

class ProfileController extends GetxController implements GetxService{
  final ProfileRepository profileRepository;
  ProfileController({required this.profileRepository});

  ProfileModel? _profileDetails;
  ProfileModel? get profileDetails => _profileDetails;



  XFile? _pickedFile;
  XFile? get pickedFile => _pickedFile;

/*  XFile? _pickedNidFront;
  XFile? get pickedNidFront => _pickedNidFront;

  XFile? _pickedNidRare;
  XFile? get pickedNidRare => _pickedNidRare;*/

  String? _selectedGender;
  String? get selectedGender => _selectedGender;

  String? _selectedRelation;
  String? get selectedRelation => _selectedRelation;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> getProfileDetails() async {
    Response response = await profileRepository.getProfileDetails();
    if(response.statusCode == 200){
      _profileDetails = ProfileModel.fromJson(response.body);
    }else{
      ApiChecker.checkApi(response);
    }
    update();
  }
  List<UserInvoiceModel>? _userInvoiceModel= [];
  List<UserInvoiceModel>? get userInvoiceModel => _userInvoiceModel;
  Future<void> getUserInvoiceList({required int page}) async {
    _isLoading=true;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      update(); // Ensure this is called after the build phase
    });
    Response response = await profileRepository.getUserInvoiceList(page: page);
    if(response.statusCode == 200){
      if (response.body["data"]["data"].isNotEmpty) {
        _userInvoiceModel?.addAll(response.body["data"]["data"].map<UserInvoiceModel>((data) => UserInvoiceModel.fromJson(data)).toList());
        update();
      } else {
        showCustomSnackBar("No Data Available", isError: false);
      }
    }else{
      ApiChecker.checkApi(response);
    }
    _isLoading=false;
    update();
  }

  void loadMore(int pageNo) {
    getUserInvoiceList(page: pageNo);
  }


  void pickImage() async {
    _pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    update();
  }

 /* void pickNidFrontImage() async {
    _pickedNidFront = await ImagePicker().pickImage(source: ImageSource.gallery);
    update();
  }

  void pickNidRareImage() async {
    _pickedNidRare = await ImagePicker().pickImage(source: ImageSource.gallery);
    update();
  }*/

  void initData() {
    _pickedFile = null;
    _selectedGender = null;
    _selectedRelation = null;
    _nidImages=[];
    _document1 = null;
    _document2 = null;
  }



  void setSelectedGender(String value, {bool isUpdate = true}){
    _selectedGender = value;
    if(isUpdate){
      update();
    }
  }

  void setSelectedRelation(String value, {bool isUpdate = true}){
    _selectedRelation = value;
    if(isUpdate){
      update();
    }
  }

  Future<void> addFamilyMember({required String name, required String mobile, String? dob,bloodGroup}) async{
    _isLoading = true;
    update();

    Map<String, String> body = {};
    body.addAll({
      'name' : name,
      'mobile' : mobile,
      'birthday' : dob ?? '',
      'gender' : _selectedGender ?? '',
      'relation' : _selectedRelation ?? '',
      'blood_group' : bloodGroup ?? '',
    });

    Response response = await profileRepository.addFamilyMember(body: body, image: _pickedFile);
    if(response.statusCode == 200){
      getProfileDetails();
      Get.back();
      showCustomSnackBar('Family member added successfully', isError: false);
    }else{
      ApiChecker.checkApi(response);
    }

    _isLoading = false;
    update();
  }


  List<TenantModel>? _tenantList= [];
  List<TenantModel>? get tenantList => _tenantList;
  Future<void> getTenantList({required int page}) async {
    print("start getting tenant data");
    _isLoading=true;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      update(); // Ensure this is called after the build phase
    });
    Response response = await profileRepository.getTenantList(page: page);
    if(response.statusCode == 200){
      if (response.body["data"]["data"].isNotEmpty) {
        _tenantList?.addAll(response.body["data"]["data"].map<TenantModel>((data) => TenantModel.fromJson(data)).toList());
        update();
      } else {
        showCustomSnackBar("No Tenant Data Available", isError: false);
      }
    }else{
      ApiChecker.checkApi(response);
    }
    _isLoading=false;
    update();
  }

  void loadMoreTenants(int pageNo) {
    getTenantList(page: pageNo);
  }



  Future<void> updateFamilyMember({required String name, required String mobile, String? dob, required int id}) async{
    _isLoading = true;
    update();

    Map<String, String> body = {};
    body.addAll({
      'id' : id.toString(),
      'name' : name,
      'mobile' : mobile,
      'birthday' : dob ?? '',
      'gender' : _selectedGender ?? '',
      'relation' : _selectedRelation ?? '',
    });

    Response response = await profileRepository.updateFamilyMember(body: body, image: _pickedFile);
    if(response.statusCode == 200){
      getProfileDetails();
      Get.back();
      showCustomSnackBar('Family member updated successfully', isError: false);
    }else{
      ApiChecker.checkApi(response);
    }

    _isLoading = false;
    update();
  }


  Future<void> addIdCardRequestTenant({required String id, details}) async{
    _isLoading = true;
    update();

    Map<String, String> body = {};
    body.addAll({
      'tenant_id' : id,
      'details' : details,
    });

    Response response = await profileRepository.addIdCardRequestTenant(body: body);
    if(response.statusCode == 200){

      showCustomSnackBar('Id Card Request send Successfully', isError: false);
    }else{
      ApiChecker.checkApi(response);
    }

    _isLoading = false;
    update();
  }

Future<void> addIdCardRequestFamilyMember({required String id, details}) async{
    _isLoading = true;
    update();

    Map<String, String> body = {};
    body.addAll({
      'family_member_id' : id,
      'details' : details,
    });

    Response response = await profileRepository.addIdCardRequestFamilyMember(body: body);
    if(response.statusCode == 200){

      showCustomSnackBar('Id Card Request send Successfully', isError: false);
    }else{
      ApiChecker.checkApi(response);
    }

    _isLoading = false;
    update();
  }



  List<XFile>? _nidImages;
  List<XFile>? get  nidImages => _nidImages;
  void pickNidImage() async {
    _nidImages!.addAll(await ImagePicker().pickMultiImage());
   // _nidImages = await ImagePicker().pickMultiImage();
    update();
  }


  Future<void> addTenant({required String name, required String mobile, String? email,houseNumber,flatNo,advanceRent,rentPerMonth,rentMonth,rentYear,address,nidNumber,document1Title,document2Title}) async{
    _isLoading = true;
    update();

    Map<String, String> body = {};
    body.addAll({
      'name' : name,
      'mobile' : mobile,
      'gender' : _selectedGender ?? '',
      'email' : email ?? '',
      'house_number' : houseNumber ?? '',
      'flat_no' : flatNo ?? '',
      'advance_rent' : advanceRent ?? '',
      'rent_per_month' : rentPerMonth ?? '',
      'rent_month' : rentMonth ?? '',
      'rent_year' : rentYear ?? '',
      'address' : address ?? '',
      'nidNumber' : nidNumber ?? '',
      'document_title[0]' : document1Title ?? '',
      'document_title[1]' : document2Title ?? '',

    });

    Response response = await profileRepository.addTenantMember(
      body: body,
      photo: _pickedFile,
      nidImages: _nidImages,
      documents1: _document1,
      documents2: _document2,

    );
    if(response.statusCode == 200){
      _tenantList!.clear();
      Get.back();
      showCustomSnackBar('Tenant added successfully', isError: false);
    }else{
      ApiChecker.checkApi(response);
    }

    _isLoading = false;
    update();
  }

  XFile ? _document1;
  XFile ? get document1 => _document1;

  Future<void> pickFile1() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      _document1 = XFile(result.files.single.path!);
      update();
    } else {
      print('File picking canceled');
    }
  }

  XFile ? _document2;
  XFile ? get document2 => _document2;

  Future<void> pickFile2() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      _document2 = XFile(result.files.single.path!);
      update();
    } else {
      print('File picking canceled');
    }
  }

  removeDocument1(){
    _document1 = null;
    update();
  }

  removeDocument2(){
    _document2 = null;
    update();
  }




  Future<void> updateTenant({required String name, required String mobile, String? email,houseNumber,flatNo,advanceRent,rentPerMonth,rentMonth,rentYear,address,nidNumber,required int id}) async{
    _isLoading = true;
    update();

    Map<String, String> body = {};
    body.addAll({
      'id' : id.toString(),
      'name' : name,
      'mobile' : mobile,
      'gender' : _selectedGender ?? '',
      'email' : email ?? '',
      'house_number' : houseNumber ?? '',
      'flat_no' : flatNo ?? '',
      'advance_rent' : advanceRent ?? '',
      'rent_per_month' : rentPerMonth ?? '',
      'rent_month' : rentMonth ?? '',
      'rent_year' : rentYear ?? '',
      'address' : address ?? '',
      'nidNumber' : nidNumber ?? '',
    });

    Response response = await profileRepository.updateTenantMember(body: body, photo: _pickedFile, );
    if(response.statusCode == 200){
      getProfileDetails();
      Get.back();
      showCustomSnackBar('Tenant updated successfully', isError: false);
    }else{
      ApiChecker.checkApi(response);
    }

    _isLoading = false;
    update();
  }

  Future<void> requestFamilyIDCard({required String id, required String details,}) async{
    _isLoading = true;
    update();

    Map<String, String> body = {};
    body.addAll({
      'family_member_id' : id,
      'details' : details,
    });

    Response response = await profileRepository.requestFamilyIDCard(body: body, );
    if(response.statusCode == 200){
      Get.back();
      showCustomSnackBar('Family member ID Card Requested successfully', isError: false);
    }else{
      ApiChecker.checkApi(response);
    }

    _isLoading = false;
    update();
  }




  Future<void> downloadLandInfo( ) async {
    final response = await profileRepository.downloadLandInfo( );

    if (response.statusCode == 200) {

      try {

        // Get the document directory path
        final directory = await getApplicationDocumentsDirectory();
        final filePath = '${directory.path}/land_info_${_profileDetails?.data?.member?.name}.pdf';

        // Save the PDF file
        final file = File(filePath);
        await file.writeAsBytes(response.bodyString!.codeUnits);

         showCustomSnackBar('PDF saved at: $filePath', isError: false);

        // Open the PDF file
        OpenFilex.open(filePath);
      } catch (e) {
        if (kDebugMode) {
          print("Error generating PDF: $e");
        }
      }

    } else {
      ApiChecker.checkApi(response);
    }
  }
  Future<void> downloadTenantInfo( ) async {
    final response = await profileRepository.downloadTenantInfo( );

    if (response.statusCode == 200) {

      try {

        // Get the document directory path
        final directory = await getApplicationDocumentsDirectory();
        final filePath = '${directory.path}/tenant_info.pdf';

        // Save the PDF file
        final file = File(filePath);
        await file.writeAsBytes(response.bodyString!.codeUnits);

         showCustomSnackBar('PDF saved at: $filePath', isError: false);

        // Open the PDF file
        OpenFilex.open(filePath);
      } catch (e) {
        if (kDebugMode) {
          print("Error generating PDF: $e");
        }
      }

    } else {
      ApiChecker.checkApi(response);
    }
  }

  Future<void> deleteFamilyMember({required int id,int? index}) async {
    final response = await profileRepository.deleteFamilyMember(id: id);
    if(response.statusCode == 200){
      showCustomSnackBar('Family Member deleted successfully', isError: false);
      _profileDetails?.data?.familyMembers!.removeAt(index!);
      update();
    }else{
      ApiChecker.checkApi(response);
    }
    update();
  }
 Future<void> deleteTenantMember({required int id,int? index}) async {
    final response = await profileRepository.deleteTenantMember(id: id);
    if(response.statusCode == 200){
      showCustomSnackBar('Tenant Member deleted successfully', isError: false);
      _tenantList!.removeAt(index!);
      update();
    }else{
      ApiChecker.checkApi(response);
    }
    update();
  }



  List<EventModel>? _eventList= [];
  List<EventModel>? get eventList => _eventList;
  Future<void> getEventList({required int page}) async {
    _isLoading=true;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      update(); // Ensure this is called after the build phase
    });
    Response response = await profileRepository.getEventList(page: page);
    if(response.statusCode == 200){
      if (response.body["data"]["data"].isNotEmpty) {
        _eventList?.addAll(response.body["data"]["data"].map<EventModel>((data) => EventModel.fromJson(data)).toList());
        update();
      } else {
        showCustomSnackBar("No Data Available", isError: false);
      }
    }else{
      ApiChecker.checkApi(response);
    }
    _isLoading=false;
    update();
  }

  void loadMoreEventData(int pageNo) {
    getEventList(page: pageNo);
  }



  void clearData() {
    _profileDetails = null;
    _userInvoiceModel?.clear();
    _isLoading = false;
    _pickedFile = null;
    _selectedGender = null;
    _selectedRelation = null;
    _nidImages?.clear();
    _document1 = null;
    _document2 = null;
    _tenantList?.clear();
    _eventList?.clear();

    update();
  }

}