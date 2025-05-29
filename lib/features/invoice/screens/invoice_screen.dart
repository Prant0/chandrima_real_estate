import 'package:chandrima_real_estate/common/widgets/custom_app_bar.dart';
import 'package:chandrima_real_estate/features/invoice/screens/invoice_details.dart';
import 'package:chandrima_real_estate/features/profile/controller/profile_controller.dart';
import 'package:chandrima_real_estate/utils/app_color.dart';
import 'package:chandrima_real_estate/utils/dimensions.dart';
import 'package:chandrima_real_estate/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class InvoiceScreen extends StatefulWidget {
    InvoiceScreen({super.key,required this.isBackButton});

  bool isBackButton;

  @override
  State<InvoiceScreen> createState() => _InvoiceScreenState();
}

class _InvoiceScreenState extends State<InvoiceScreen> {

  late ScrollController _scrollController;
  int page=1 ;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();


    /// Manage scroll
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent && !Get.find<ProfileController>().isLoading) {
        Get.find<ProfileController>().loadMore(page=page+1);
      }
    });



  }
  RefreshController _refreshController = RefreshController(initialRefresh: false);

  void _onRefresh() async{
    // monitor network fetch
    Get.find<ProfileController>().userInvoiceModel!.clear();
    page=1;

    await Get.find<ProfileController>().getUserInvoiceList(page: page);
    _refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:AppColors.background,
      appBar:CustomAppBar(title: 'Invoice',

      backButton:widget.isBackButton==true?true :false,),
      body: GetBuilder<ProfileController>(
        builder: (profileController) {
          return SmartRefresher(
            enablePullDown: true,
            onRefresh: _onRefresh,
            controller: _refreshController,
            scrollController: _scrollController,
            child: Padding(
              padding: const EdgeInsets.all(Dimensions.paddingSizeTen),
              child: SingleChildScrollView(
              //  controller: _scrollController,
                child: Column(
                 // physics: NeverScrollableScrollPhysics(),
                  children: [
                    profileController.userInvoiceModel==null?  Text("No Invoice Found",style: poppinsMedium,): ListView.builder(
                      shrinkWrap: true,
                      physics:   NeverScrollableScrollPhysics(),
                      itemCount: profileController.userInvoiceModel!.length,
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) {
                        var data= profileController.userInvoiceModel![index];
                        return InkWell(
                          onTap: (){
                            Get.to(InvoiceDetails(userInvoice: data));
                          },
                          child: Card(
                            child: Container(
                              padding: const EdgeInsets.all(Dimensions.paddingSizeFifteen),
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(Dimensions.radiusTen),
                                // boxShadow:  [BoxShadow(color: Colors.black12, spreadRadius: 0.5, blurRadius: 5)],
                              ),
                              child: Column(children: [

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Invoice #${data.invoiceId}', style: poppinsMedium.copyWith(fontSize: Dimensions.fontSizeSixteen)),

                                    Container(
                                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                                      decoration: BoxDecoration(
                                        color:data.paymentStatus!.toUpperCase()=="PAID"?AppColors.green: Colors.orange.withOpacity(0.8),
                                        borderRadius: BorderRadius.circular(Dimensions.radiusTen),
                                        border: Border.all(color: data.paymentStatus!.toUpperCase()=="PAID"?AppColors.green:Colors.deepOrange,width: 1),
                                      ),
                                      child: Text('${data.paymentStatus=="null"?"PENDING":data.paymentStatus!.toUpperCase()}', style: poppinsMedium.copyWith(fontSize: Dimensions.fontSizeFourteen,color: Colors.white)),
                                    ),

                                  ],
                                ),
                                SizedBox(height: 8,),

                                FittedBox(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Total Amount: ${data.totalAmount} Tk', style: poppinsRegular),
                                      Text('Due Date: ${DateFormat('M-d-yyyy').format(DateTime.parse(data.createdAt.toString()))}', style: poppinsRegular),
                                    ],
                                  ),
                                ),



                              ]),
                            ),
                          ),
                        );
                      },
                    ),


                    profileController.isLoading? Padding(padding: EdgeInsets.symmetric(vertical: 25),
                    child: CircularProgressIndicator(),
                    ):SizedBox(height: 30,)

                  ],
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}
