import 'dart:io';

import 'package:chandrima_real_estate/common/widgets/custom_snackbar.dart';
import 'package:chandrima_real_estate/data/api/api_checker.dart';
import 'package:chandrima_real_estate/features/profile/models/UserInvoiceModel.dart';
import 'package:chandrima_real_estate/features/profile/models/profile_model.dart';
import 'package:chandrima_real_estate/features/profile/repository/profile_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';

class ProfileController extends GetxController implements GetxService{
  final ProfileRepository profileRepository;
  ProfileController({required this.profileRepository});

  ProfileModel? _profileDetails;
  ProfileModel? get profileDetails => _profileDetails;


  UserInvoiceModel? _userInvoiceModel;
  UserInvoiceModel? get userInvoiceModel => _userInvoiceModel;

  XFile? _pickedFile;
  XFile? get pickedFile => _pickedFile;

  XFile? _pickedNidFront;
  XFile? get pickedNidFront => _pickedNidFront;

  XFile? _pickedNidRare;
  XFile? get pickedNidRare => _pickedNidRare;

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


  Future<void> getUserInvoiceList() async {
    Response response = await profileRepository.getUserInvoiceList();
    if(response.statusCode == 200){
      _userInvoiceModel = UserInvoiceModel.fromJson(response.body);
      print("all data length areeeeeeeeeeeee${_userInvoiceModel!.data!.data!.length}");
    }else{
      ApiChecker.checkApi(response);
    }
    update();
  }

  void pickImage() async {
    _pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    update();
  }

  void pickNidFrontImage() async {
    _pickedNidFront = await ImagePicker().pickImage(source: ImageSource.gallery);
    update();
  }

  void pickNidRareImage() async {
    _pickedNidRare = await ImagePicker().pickImage(source: ImageSource.gallery);
    update();
  }

  void initData() {
    _pickedFile = null;
    _selectedGender = null;
    _selectedRelation = null;
    _pickedNidFront = null;
    _pickedNidRare = null;
    //update();
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

  Future<void> addFamilyMember({required String name, required String mobile, String? dob}) async{
    _isLoading = true;
    update();

    Map<String, String> body = {};
    body.addAll({
      'name' : name,
      'mobile' : mobile,
      'birthday' : dob ?? '',
      'gender' : _selectedGender ?? '',
      'relation' : _selectedRelation ?? '',
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

  Future<void> addTenant({required String name, required String mobile, String? email,houseNumber,flatNo,advanceRent,rentPerMonth,rentMonth,rentYear,address,nidNumber}) async{
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
    });

    Response response = await profileRepository.addTenantMember(body: body, photo: _pickedFile,nidFront: _pickedNidFront,nidRare: _pickedNidRare);
    if(response.statusCode == 200){
      getProfileDetails();
      Get.back();
      showCustomSnackBar('Tenant added successfully', isError: false);
    }else{
      ApiChecker.checkApi(response);
    }

    _isLoading = false;
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

    Response response = await profileRepository.updateTenantMember(body: body, photo: _pickedFile,nidFront: _pickedNidFront,nidRare: _pickedNidRare);
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
      _profileDetails?.data?.tenants!.removeAt(index!);
      update();
    }else{
      ApiChecker.checkApi(response);
    }
    update();
  }

}