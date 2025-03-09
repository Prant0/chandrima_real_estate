import 'package:chandrima_real_estate/common/widgets/custom_network_image.dart';
import 'package:chandrima_real_estate/features/complain/controller/complain_controller.dart';
import 'package:chandrima_real_estate/features/complain/model/complain_model.dart';
import 'package:chandrima_real_estate/features/complain/screens/complain_details_screen.dart';
import 'package:chandrima_real_estate/utils/app_color.dart';
import 'package:chandrima_real_estate/utils/dimensions.dart';
import 'package:chandrima_real_estate/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:photo_view/photo_view.dart';
class ComplainDetailsScreen extends StatefulWidget {
    ComplainDetailsScreen({super.key,this.complaints});

  Complaint ?complaints;

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
              'Date: ${DateFormat('M-d-yyyy').format(DateTime.parse("${widget.complaints?.createdAt ?? ''}"))}',
              style: poppinsRegular.copyWith(fontSize: Dimensions.fontSizeSixteen, color: AppColors.black),
            ),
            SizedBox(height: Dimensions.paddingSizeTen),
            Text(
              'Description :',
              style: poppinsBold.copyWith(fontSize: Dimensions.fontSizeSixteen, color: AppColors.primary),
            ),
            SizedBox(height: Dimensions.paddingSizeFive),


            Text(
              '${widget.complaints?.description ?? ''}',
              style: poppinsRegular.copyWith(fontSize: Dimensions.fontSizeSixteen, color: AppColors.black),
            ),
            SizedBox(height: Dimensions.paddingSizeTen),
            widget.complaints!.resolution!=null?
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  'Solution :',
                  style: poppinsBold.copyWith(fontSize: Dimensions.fontSizeSixteen, color: AppColors.primary),
                ),
                SizedBox(height: Dimensions.paddingSizeFive),
                Text(
                  '${widget.complaints?.resolution ?? ''}',
                  style: poppinsRegular.copyWith(fontSize: Dimensions.fontSizeFourteen, color: AppColors.black),
                ),
                SizedBox(height: Dimensions.paddingSizeFive),
              ],
            ):SizedBox(),



            widget.complaints?.document!=null?  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  'Documents : ',
                  style: poppinsBold.copyWith(fontSize: Dimensions.fontSizeSixteen, color: AppColors.primary),
                ),
                SizedBox(height: Dimensions.paddingSizeTen),
                GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    childAspectRatio: 1
                ),
                    shrinkWrap: true,

                    itemCount: widget.complaints?.document?.length??0,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Get.to(() => FullScreenImage(
                            image: "${widget.complaints?.documentPath}/${widget.complaints?.document![index]}",
                          ));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.purpleColor,
                          ),
                          child:CustomNetworkImage(image: "${widget.complaints?.documentPath}/${widget.complaints?.document![index]}",height: 100,width: 100,fit: BoxFit.fill,),
                        ),
                      );
                    },),
              ],
            ):SizedBox(height: 1,)


          ],
        ),
      ),
    );
  }
}


class FullScreenImage extends StatelessWidget {
    FullScreenImage({super.key,this.image});
  String ?image;

  @override
  Widget build(BuildContext context) {
    return   Scaffold(

      body: PhotoView(
        imageProvider: NetworkImage("$image"),
      ),
    );
  }
}

