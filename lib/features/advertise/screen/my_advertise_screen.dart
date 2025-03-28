import 'package:chandrima_real_estate/common/widgets/custom_app_bar.dart';
import 'package:chandrima_real_estate/features/advertise/screen/add_advertise.dart';
import 'package:chandrima_real_estate/features/home/controller/home_controller.dart';
import 'package:chandrima_real_estate/utils/app_color.dart';
import 'package:chandrima_real_estate/utils/dimensions.dart';
import 'package:chandrima_real_estate/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';


class MyAdvertiseScreen extends StatefulWidget {
  const MyAdvertiseScreen({super.key});

  @override
  State<MyAdvertiseScreen> createState() => _MyAdvertiseScreenState();
}

class _MyAdvertiseScreenState extends State<MyAdvertiseScreen> {



  late ScrollController _scrollController;
  int page=1 ;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      HomeController homeController = Get.find<HomeController>();
      homeController.myAdvertiseModel!.clear();
      homeController.getMyAdvertise(page: 1);
    });

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent && Get.find<HomeController>().isLoading==false) {
        Get.find<HomeController>().loadMoreAdvertise(page = page + 1);
      }
    });
  }



  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        Get.to(AddAdvertiseScreen())!.then((ba){
          page=1;
          HomeController homeController = Get.find<HomeController>();
          homeController.getMyAdvertise(page: 1);
        });
      },
      child: Icon(Icons.add,color: Colors.white,),
        backgroundColor: AppColors.primary,
      ),
      appBar:CustomAppBar(title: "My Advertises",backButton: true,),
      body: GetBuilder<HomeController>(
          builder: (homeController) {
            return Padding(
              padding: const EdgeInsets.all(Dimensions.paddingSizeTen),
              child: SingleChildScrollView(
              controller: _scrollController,
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    homeController.myAdvertiseModel==null?Center(child: Text("No Data Found")): ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: homeController.myAdvertiseModel!.length,
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) {
                        var data= homeController.myAdvertiseModel?[index];
                        return InkWell(
                          onTap: (){
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Advertise Details'),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Title: ${data?.title}'),
                                      Text('Date: ${DateFormat('M-d-yyyy').format(DateTime.parse("${data?.createdAt}"))}'),
                                      Text('Status: ${data?.status}'),
                                      Text('Details: ${data?.description}'),

                                      // Add more details as needed
                                    ],
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('Close'),
                                    ),
                                  ],
                                );
                              },
                            );
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
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  ClipRRect(
                                      child: Image.network("${data!.image}",height: 100,width: 80,fit: BoxFit.cover,),
                                  borderRadius: BorderRadius.circular(16),
                                  ),
                                  SizedBox(width: 22,),
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
                                          Container(
                                            margin: EdgeInsets.only(top: 6),
                                            padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeTen, vertical: Dimensions.paddingSizeFive),
                                            decoration: BoxDecoration(

                                              color: data?.status == 'pending' ? Colors.blue : data?.status == 'active' ? AppColors.green : AppColors.grey,
                                              borderRadius: BorderRadius.circular(5),
                                            ),
                                            child: Text("${data?.status}", style: poppinsRegular.copyWith(color: Colors.white),),
                                          )
                                        ]),
                                  ),




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

                    homeController.isLoading?Padding(
                      padding: const EdgeInsets.all(28.0),
                      child: CircularProgressIndicator(),
                    ):SizedBox(height: 30,),
                  ],
                ),
              ),
            );
          }
      ),
    );
  }
}
