import 'dart:io';
import 'package:chandrima_real_estate/common/widgets/custom_snackbar.dart';
import 'package:chandrima_real_estate/data/api/api_checker.dart';
import 'package:chandrima_real_estate/features/gate_pass/model/gate_pass_list_model.dart';
import 'package:chandrima_real_estate/features/gate_pass/repository/gate_pass_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';

class GatePassController extends GetxController implements GetxService{
  final GatePassRepository gatePassRepository;
  GatePassController({required this.gatePassRepository});

  List<GatePassData>? _gatePassList;
  List<GatePassData>? get gatePassList => _gatePassList;

  XFile? _paymentDocument;
  XFile? get paymentDocument => _paymentDocument;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> getGatePassList() async {
    final response = await gatePassRepository.getGatePassList();

    if(response.statusCode == 200){
      _gatePassList = [];
      _gatePassList = response.body['data'] ['data'].map<GatePassData>((data) => GatePassData.fromJson(data)).toList();
    }else{
      ApiChecker.checkApi(response);
    }
    update();
  }

  Future<void> addGatePass(Map<String, String> data) async {
    _isLoading = true;
    update();

    final response = await gatePassRepository.addGatePass(data, _paymentDocument);
    if(response.statusCode == 200){
      Get.back();
      showCustomSnackBar('Gate Pass added successfully', isError: false);
      getGatePassList();
    }else{
      ApiChecker.checkApi(response);
    }

    _isLoading = false;
    update();
  }

  Future<void> deleteGatePass({required int gatePassId}) async {
    final response = await gatePassRepository.deleteGatePass(gatePassId: gatePassId);
    if(response.statusCode == 200){
      showCustomSnackBar('Gate Pass deleted successfully', isError: false);
      getGatePassList();
    }else{
      ApiChecker.checkApi(response);
    }
    update();
  }

  void pickPaymentDocument() async {
    _paymentDocument = await ImagePicker().pickImage(source: ImageSource.gallery);
    update();
  }

  Future<void> downloadGatePass({required int gatePassId}) async {
    final response = await gatePassRepository.downloadGatePass(gatePassId: gatePassId);

    if (response.statusCode == 200) {

      try {

        // Get the document directory path
        final directory = await getApplicationDocumentsDirectory();
        final filePath = '${directory.path}/gate_pass_$gatePassId.pdf';

        // Save the PDF file
        final file = File(filePath);
        await file.writeAsBytes(response.bodyString!.codeUnits);

       //showCustomSnackBar('PDF saved at: $filePath', isError: false);

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

}
