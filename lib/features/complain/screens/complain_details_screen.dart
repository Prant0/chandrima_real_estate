import 'package:chandrima_real_estate/features/complain/controller/complain_controller.dart';
import 'package:chandrima_real_estate/features/complain/model/complain_model.dart';
import 'package:chandrima_real_estate/features/complain/screens/complain_details_screen.dart';
import 'package:chandrima_real_estate/utils/app_color.dart';
import 'package:chandrima_real_estate/utils/dimensions.dart';
import 'package:chandrima_real_estate/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
class ComplainDetailsScreen extends StatefulWidget {
    ComplainDetailsScreen({super.key,this.complaints});

  Complaints ?complaints;

  @override
  State<ComplainDetailsScreen> createState() => _ComplainDetailsScreenState();
}

class _ComplainDetailsScreenState extends State<ComplainDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Get.back(),
        ),
        centerTitle: true,
        title: Text('Complaint Details', style: poppinsBold.copyWith(fontSize: Dimensions.fontSizeTwenty,color: Colors.white),),
        backgroundColor: AppColors.purpleColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(Dimensions.paddingSizeTwenty),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Title: ${widget.complaints?.title ?? ''}',
              style: poppinsBold.copyWith(fontSize: Dimensions.fontSizeTwenty, color: AppColors.primary),
            ),
            SizedBox(height: Dimensions.paddingSizeTen),
            Text(
              'Category: ${widget.complaints?.complaintCategory ?? ''}',
              style: poppinsRegular.copyWith(fontSize: Dimensions.fontSizeSixteen, color: AppColors.black),
            ),
            SizedBox(height: Dimensions.paddingSizeTen),
            Text(
              'Status: ${widget.complaints?.status ?? ''}',
              style: poppinsRegular.copyWith(fontSize: Dimensions.fontSizeSixteen, color: AppColors.black),
            ),
            SizedBox(height: Dimensions.paddingSizeTen),
            Text(
              'Description:',
              style: poppinsBold.copyWith(fontSize: Dimensions.fontSizeSixteen, color: AppColors.primary),
            ),
            SizedBox(height: Dimensions.paddingSizeFive),
            Text(
              '${widget.complaints?.description ?? ''}',
              style: poppinsRegular.copyWith(fontSize: Dimensions.fontSizeFourteen, color: AppColors.black),
            ),
            SizedBox(height: Dimensions.paddingSizeTen),
            Text(
              'Created At: ${DateFormat('M-d-yyyy').format(DateTime.parse("${widget.complaints?.createdAt ?? ''}"))}',
              style: poppinsRegular.copyWith(fontSize: Dimensions.fontSizeFourteen, color: AppColors.black),
            ),


          ],
        ),
      ),
    );
  }
}
