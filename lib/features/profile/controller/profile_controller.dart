import 'package:chandrima_real_estate/common/widgets/custom_snackbar.dart';
import 'package:chandrima_real_estate/data/api/api_checker.dart';
import 'package:chandrima_real_estate/features/profile/models/profile_model.dart';
import 'package:chandrima_real_estate/features/profile/repository/profile_repository.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController implements GetxService{
  final ProfileRepository profileRepository;
  ProfileController({required this.profileRepository});

  ProfileModel? _profileDetails;
  ProfileModel? get profileDetails => _profileDetails;

  XFile? _pickedFile;
  XFile? get pickedFile => _pickedFile;

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

  void pickImage() async {
    _pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    update();
  }

  void initData() {
    _pickedFile = null;
  }

  void setSelectedGender(String value){
    _selectedGender = value;
    update();
  }

  void setSelectedRelation(String value){
    _selectedRelation = value;
    update();
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
      showCustomSnackBar('Family member added successfully');
    }else{
      ApiChecker.checkApi(response);
    }

    _isLoading = false;
    update();
  }

}