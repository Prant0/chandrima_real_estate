import 'package:chandrima_real_estate/features/complain/controller/complain_controller.dart';
import 'package:chandrima_real_estate/features/complain/screens/add_complain_screen.dart';
import 'package:chandrima_real_estate/features/complain/screens/complain_details_screen.dart';
import 'package:chandrima_real_estate/utils/app_color.dart';
import 'package:chandrima_real_estate/utils/dimensions.dart';
import 'package:chandrima_real_estate/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ComplainScreen extends StatefulWidget {
    ComplainScreen({super.key, this.isShowAppBar  });
  bool ?isShowAppBar =true ;

  @override
  State<ComplainScreen> createState() => _ComplainScreenState();
}

class _ComplainScreenState extends State<ComplainScreen> {
  @override
  void initState() {
    super.initState();
    ComplainController homeController = Get.find<ComplainController>();
    homeController.getComplainList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(AddComplainScreen(
            complaintCategories: Get.find<ComplainController>().complainModel!.data!.complaintCategories,
          ));
        },
        child: Icon(Icons.add,color: Colors.white,),
        backgroundColor: AppColors.purpleColor,
      ),
      backgroundColor:AppColors.background,
      appBar: widget.isShowAppBar==true?AppBar(
        /*leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Get.back(),
        ),*/
        centerTitle: true,
        title:   Text('My Complaints',style: poppinsBold.copyWith(fontSize: Dimensions.fontSizeTwenty,color: Colors.white),),
        backgroundColor: AppColors.purpleColor,
      ):null,
      body: GetBuilder<ComplainController>(
          builder: (complainController) {
            return Padding(
              padding: const EdgeInsets.all(Dimensions.paddingSizeTwenty),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    complainController.complainModel==null?SizedBox(): ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: complainController.complainModel?.data?.complaints?.length,
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) {
                        var data= complainController.complainModel?.data?.complaints?[index];
                        return InkWell(
                          onTap: (){
                             Get.to(ComplainDetailsScreen(complaints: data));
                          },
                          child: Card(
                            child: Container(
                              padding: const EdgeInsets.all(Dimensions.paddingSizeFifteen),
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(Dimensions.radiusTen),
                                // boxShadow:  [BoxShadow(color: Colors.black12, spreadRadius: 0.5, blurRadius: 5)],
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                      Text("Sl No: ${index+1}", style: poppinsMedium.copyWith(fontSize: Dimensions.fontSizeSixteen,color: AppColors.primary,fontWeight: FontWeight.w700),),
                                      SizedBox(height: 4,),
                                      Text('${data?.title}', style: poppinsMedium.copyWith(fontSize: Dimensions.fontSizeSixteen,fontWeight: FontWeight.w800) ,maxLines: 3,),

                                      SizedBox(height: 4,),
                                      RichText(
                                            text: TextSpan(
                                              text: 'Category : ',
                                              style: poppinsRegular.copyWith(fontSize: Dimensions.fontSizeSixteen, color: AppColors.primary,fontWeight: FontWeight.w800),
                                              children: <TextSpan>[
                                                TextSpan(
                                                  text: '${data?.complaintCategory}',
                                                  style: poppinsMedium.copyWith(fontSize: Dimensions.fontSizeSixteen,color: AppColors.black),
                                                ),
                                              ],
                                            ),
                                          ),
                                      SizedBox(height: 4,),
                                      RichText(
                                            text: TextSpan(
                                              text: 'Status : ',
                                              style: poppinsRegular.copyWith(fontSize: Dimensions.fontSizeSixteen, color: AppColors.primary,fontWeight: FontWeight.w800),
                                              children: <TextSpan>[
                                                TextSpan(
                                                  text: '${data?.status}',
                                                  style: poppinsMedium.copyWith(fontSize: Dimensions.fontSizeSixteen,color: AppColors.black),
                                                ),
                                              ],
                                            ),
                                          ),

                                      SizedBox(height: 4,),
                                      Text('Created at : ${DateFormat('M-d-yyyy').format(DateTime.parse("${data?.createdAt}"))}', style: poppinsRegular),
                                    ]),
                                  ),
                                  Column(
                                    children: [
                                      InkWell(
                                        child: Icon(Icons.delete, color: AppColors.red),
                                        onTap: () {
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title: Text('Delete Complaint'),
                                                content: Text('Are you sure you want to delete this complaint?'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () {
                                                      Navigator.of(context).pop(); // Close the dialog
                                                    },
                                                    child: Text('No'),
                                                  ),
                                                  TextButton(
                                                    onPressed: () {
                                                      // Add your delete logic here
                                                      Navigator.of(context).pop(); // Close the dialog
                                                    },
                                                    child: Text('Yes'),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        },
                                      ),
                                      SizedBox(height: 18,),
                                      Icon(Icons.edit,color: AppColors.primary,),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),

                  ],
                ),
              ),
            );
          }
      ),
    );
  }
}
