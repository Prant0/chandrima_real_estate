import 'package:chandrima_real_estate/features/invoice/screens/invoice_details.dart';
import 'package:chandrima_real_estate/features/profile/controller/profile_controller.dart';
import 'package:chandrima_real_estate/utils/app_color.dart';
import 'package:chandrima_real_estate/utils/dimensions.dart';
import 'package:chandrima_real_estate/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class InvoiceScreen extends StatefulWidget {
  const InvoiceScreen({super.key});

  @override
  State<InvoiceScreen> createState() => _InvoiceScreenState();
}

class _InvoiceScreenState extends State<InvoiceScreen> {
  @override
  void initState() {
    // TODO: implement initState
    //Get.find<ProfileController>().getUserInvoiceList();
    super.initState();
  }//


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:AppColors.background,
      appBar: AppBar(
        title:   Text('Invoice',style: poppinsBold.copyWith(fontSize: Dimensions.fontSizeTwenty,color: Colors.white),),
        backgroundColor: AppColors.purpleColor,
      ),
      body: GetBuilder<ProfileController>(
        builder: (profileController) {
          return Padding(
            padding: const EdgeInsets.all(Dimensions.paddingSizeTen),
            child: SingleChildScrollView(
              child: Column(
                children: [

                  profileController.userInvoiceModel==null?SizedBox(): ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: profileController.userInvoiceModel!.data!.data!.length,
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) {
                      var data= profileController.userInvoiceModel!.data!.data![index];
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
                                      color: Colors.orange.withOpacity(0.8),
                                      borderRadius: BorderRadius.circular(Dimensions.radiusTen),
                                      border: Border.all(color: Colors.deepOrange,width: 1),
                                    ),
                                    child: Text('${data.paymentStatus}', style: poppinsMedium.copyWith(fontSize: Dimensions.fontSizeFourteen,color: Colors.white)),
                                  ),

                                ],
                              ),
                              SizedBox(height: 8,),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Total Amount: ${data.totalAmount} Tk', style: poppinsRegular),
                                  Text('Due Date: ${DateFormat('M-d-yyyy').format(DateTime.parse(data.createdAt.toString()))}', style: poppinsRegular),
                                ],
                              ),



                            ]),
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
