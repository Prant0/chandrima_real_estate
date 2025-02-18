import 'package:chandrima_real_estate/common/widgets/custom_snackbar.dart';
import 'package:chandrima_real_estate/data/api/api_checker.dart';
import 'package:chandrima_real_estate/features/complain/model/complain_model.dart';
import 'package:chandrima_real_estate/features/complain/repository/complain_repository.dart';
import 'package:chandrima_real_estate/features/home/model/advertises_list_model.dart';
import 'package:get/get.dart';
import 'package:chandrima_real_estate/features/home/repository/home_repository.dart';
import 'package:image_picker/image_picker.dart';

class ComplainController extends GetxController implements GetxService {
  final ComplainRepository complainRepository;
  ComplainController({required this.complainRepository});

  ComplainModel? _complainModel;
  ComplainModel? get complainModel => _complainModel;
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> getComplainList() async {
    Response response = await complainRepository.getComplainList();
    if (response.statusCode == 200) {
      _complainModel = ComplainModel.fromJson(response.body);
    }else{
      ApiChecker.checkApi(response);
    }
    update();
  }

  Future<void> addComplaint({required String categoryId, required String title, String? details}) async{
    _isLoading = true;
    update();

    Map<String, String> body = {};
    body.addAll({
      'category_id' : categoryId,
      'title' : title,
      'description' : details ?? '',
    });

    Response response = await complainRepository.addComplain(body: body, image: _complaintImages);
    if(response.statusCode == 200){
      _complaintImages = null;
      getComplainList();
      Get.back();
      showCustomSnackBar('Complaint added successfully', isError: false);
    }else{
      ApiChecker.checkApi(response);
    }

    _isLoading = false;
    update();
  }





  List<XFile>? _complaintImages;
  List<XFile>? get complaintImages => _complaintImages;
  void pickNidFrontImage() async {
    _complaintImages = await ImagePicker().pickMultiImage();
    update();
  }


}