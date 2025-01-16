import 'package:chandrima_real_estate/utils/app_color.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:chandrima_real_estate/utils/dimensions.dart';

  showCustomSnackBar(String? message, {bool isError = true, showToaster = true}) {
  if(message != null && message.isNotEmpty) {

    if(showToaster && !GetPlatform.isWeb){
      Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: isError ? AppColors.red : AppColors.green,
        textColor: AppColors.white,
        fontSize: Dimensions.fontSizeFourteen,
      );
    }
  }
}