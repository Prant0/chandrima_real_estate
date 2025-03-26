import 'package:chandrima_real_estate/common/widgets/custom_app_bar.dart';
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
    ComplainScreen({super.key,required this.isShowAppBar  });
  bool ?isShowAppBar =true ;

  @override
  State<ComplainScreen> createState() => _ComplainScreenState();
}

class _ComplainScreenState extends State<ComplainScreen> {



  late ScrollController _scrollController;
  int page=1 ;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();

    ComplainController homeController = Get.find<ComplainController>();
    homeController.getComplainList(page: 1);
    homeController.complainModelList!.clear();

   // Get.find<ApplicationListController>().getApplicationList(page: 1);

    /// Manage scroll
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent && !Get.find<ComplainController>().isLoading) {
         Get.find<ComplainController>().loadMore(page=page+1);
      }
    });

  }








  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:widget.isShowAppBar==true? CustomAppBar(title: "My Complaints",
        backButton: true,
      ):null,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(AddComplainScreen(
            //complaintCategories: Get.find<ComplainController>().complainModel!.data!.complaintCategories,
          ));
        },
        child: Icon(Icons.add,color: Colors.white,),
        backgroundColor: AppColors.purpleColor,
      ),
      backgroundColor:AppColors.background,

      body: GetBuilder<ComplainController>(
          builder: (complainController) {
            return Padding(
              padding: const EdgeInsets.all(Dimensions.paddingSizeTen),
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  children: [
                    complainController.complainModelList==null?SizedBox(): ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: complainController.complainModelList!.length,
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) {
                        var data= complainController.complainModelList?[index];
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                      Text("Sl No: ${index+1}", style: poppinsMedium.copyWith(fontSize: Dimensions.fontSizeSixteen,color: AppColors.primary,fontWeight: FontWeight.w700),),
                                      SizedBox(height: 4,),
                                        RichText(
                                            text: TextSpan(
                                              text: 'Title : ',
                                              style: poppinsRegular.copyWith(fontSize: Dimensions.fontSizeSixteen, color: AppColors.primary,fontWeight: FontWeight.w800),
                                              children: <TextSpan>[
                                                TextSpan(
                                                  text: '${data?.title}',
                                                  style: poppinsMedium.copyWith(fontSize: Dimensions.fontSizeSixteen,color: AppColors.black),
                                                ),
                                              ],
                                            ),
                                          ),
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
                                     /* SizedBox(height: 4,),
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
                                          ),*/

                                      SizedBox(height: 4,),
                                          RichText(
                                            text: TextSpan(
                                              text: 'Date : ',
                                              style: poppinsRegular.copyWith(fontSize: Dimensions.fontSizeSixteen, color: AppColors.primary,fontWeight: FontWeight.w800),
                                              children: <TextSpan>[
                                                TextSpan(
                                                  text: '${DateFormat('M-d-yyyy').format(DateTime.parse("${data?.createdAt}"))}',
                                                  style: poppinsMedium.copyWith(fontSize: Dimensions.fontSizeSixteen,color: AppColors.black),
                                                ),
                                              ],
                                            ),
                                          ),
                                     ]),
                                  ),

                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeTen, vertical: Dimensions.paddingSizeFive),
                                    decoration: BoxDecoration(
                                      color: data?.status == 'In Progress' ? Colors.blue : data?.status == 'On Hold' ? AppColors.red : data?.status == 'Resolved' ?Colors.green: data?.status == 'Completed' ?Colors.green:data?.status == 'Open' ?Colors.orange: AppColors.grey,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Text("${data?.status}", style: poppinsRegular.copyWith(color: Colors.white),),
                                  )


                                  /*Column(
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
                                                      complainController.deleteComplainList(data!.id.toString(), index);
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
                                     *//* SizedBox(height: 18,),
                                      InkWell(
                                          onTap: (){

                                          },
                                          child: Icon(Icons.edit,color: AppColors.primary,)),*//*
                                    ],
                                  ),*/
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
