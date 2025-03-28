import 'package:chandrima_real_estate/common/widgets/custom_snackbar.dart';
import 'package:chandrima_real_estate/data/api/api_checker.dart';
import 'package:chandrima_real_estate/features/complain/model/complain_category_model.dart';
import 'package:chandrima_real_estate/features/complain/model/complain_model.dart';
import 'package:chandrima_real_estate/features/complain/repository/complain_repository.dart';
 import 'package:get/get.dart';
import 'package:chandrima_real_estate/features/home/repository/home_repository.dart';
import 'package:image_picker/image_picker.dart';

class ComplainController extends GetxController implements GetxService {
  final ComplainRepository complainRepository;
  ComplainController({required this.complainRepository});

  ComplaintCategoryModel? _complaintCategoryModel;
  ComplaintCategoryModel? get complaintCategoryModel => _complaintCategoryModel;
  bool _isLoading = false;
  bool get isLoading => _isLoading;




  final List<ComplainModelList> _complainModelList = [];
  List<ComplainModelList>? get complainModelList => _complainModelList;



  bool? _isDetailsShow = false;
  bool? get isDetailsShow => _isDetailsShow;

  Future<void> getComplainList({required int page}) async {
    _isLoading=true;
    update();
    Response response = await complainRepository.getComplainList(page: page);
    if (response.statusCode == 200) {
     // _complainModel = ComplainModel.fromJson(response.body);
      if (response.body["data"]["complaints"]["data"].isNotEmpty) {
        _complainModelList.addAll(response.body["data"]["complaints"]["data"].map<ComplainModelList>((data) => ComplainModelList.fromJson(data)).toList());

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
    getComplainList(page: pageNo);
  }

  Future<void> getComplainCategory( ) async {
    _isLoading=true;
    Response response = await complainRepository.getComplainCategory( );
    if (response.statusCode == 200) {
      _complaintCategoryModel = ComplaintCategoryModel.fromJson(response.body);
    }else{
      ApiChecker.checkApi(response);
    }
    _isLoading=false;
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
      getComplainList(page: 1);
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