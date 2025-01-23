import 'package:chandrima_real_estate/features/profile/controller/profile_controller.dart';
import 'package:chandrima_real_estate/features/profile/models/UserInvoiceModel.dart';
import 'package:chandrima_real_estate/utils/app_color.dart';
import 'package:chandrima_real_estate/utils/dimensions.dart';
import 'package:chandrima_real_estate/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class InvoiceDetails extends StatelessWidget {
  UserInvoiceList userInvoice;
    InvoiceDetails({super.key,required this.userInvoice });

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios,color: Colors.white,),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        title: Text('Invoice Details',style: poppinsBold.copyWith(fontSize: Dimensions.fontSizeTwenty,color: Colors.white),),
        backgroundColor: AppColors.purpleColor,
      ),
      body: Container(
        padding: EdgeInsets.all(Dimensions.paddingSizeTwenty),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(Dimensions.radiusTen),
                  ),
                  padding: EdgeInsets.all(Dimensions.paddingSizeTwenty),
                  child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Invoice ID', style: poppinsBold.copyWith(fontSize: Dimensions.fontSizeSixteen,color: AppColors.purpleColor)),
                          SizedBox(height: 4,),
                          Text('#${userInvoice.invoiceId}', style: poppinsMedium.copyWith(fontSize: Dimensions.fontSizeSixteen,color: AppColors.textColor)),
                        ],
                      ),
                      //
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Member ID', style: poppinsBold.copyWith(fontSize: Dimensions.fontSizeSixteen,color: AppColors.purpleColor)),
                          SizedBox(height: 4,),
                          Text('${userInvoice.memberId}', style: poppinsMedium.copyWith(fontSize: Dimensions.fontSizeSixteen,color: AppColors.textColor)),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Status', style: poppinsBold.copyWith(fontSize: Dimensions.fontSizeSixteen,color: AppColors.purpleColor)),
                          SizedBox(height: 4,),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                            decoration: BoxDecoration(
                              color: Colors.orange.withOpacity(0.8),
                              borderRadius: BorderRadius.circular(Dimensions.radiusTen),
                              border: Border.all(color: Colors.deepOrange,width: 1),
                            ),
                            child: Text('${userInvoice.paymentStatus}', style: poppinsMedium.copyWith(fontSize: Dimensions.fontSizeFourteen,color: Colors.white)),
                          ),
                        ],
                      ),
          
          
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10,),
          
              GetBuilder<ProfileController>(
                builder: (profileController) {
                  return Card(
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(Dimensions.radiusTen),
                      ),
                      padding: EdgeInsets.all(Dimensions.paddingSizeTwenty),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('To', style: poppinsBold.copyWith(fontSize: Dimensions.fontSizeSixteen,color: AppColors.purpleColor)),
                          SizedBox(height: 4,),
                          Text("Name : ${profileController.profileDetails?.data?.member?.name ?? ''}", style: poppinsMedium.copyWith(fontSize: Dimensions.fontSizeSixteen,  )),
                          SizedBox(height: 2,),
                          Text("Email : ${profileController.profileDetails?.data?.member?.email ?? ''}", style: poppinsMedium  ),
                          SizedBox(height: 2,),
                          Text("Mobile : ${profileController.profileDetails?.data?.member?.mobile ?? ''}", style: poppinsMedium ),
                          SizedBox(height: 2,),
                          Text("Address : ${profileController.profileDetails?.data?.member?.permanentAddress ?? ''}", style: poppinsMedium ),
          
                        ],
                      ),
                    ),
                  );
                }
              ),
              SizedBox(height: 10,),
              Card(
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(Dimensions.radiusTen),
                  ),
                  padding: EdgeInsets.all(Dimensions.paddingSizeTwenty),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Services', style: poppinsBold.copyWith(fontSize: Dimensions.fontSizeSixteen,color: AppColors.purpleColor)),
                      SizedBox(height: 4,),
                      Column(
                        children: userInvoice.services!.map((e) => Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('${e.serviceName}', style: poppinsMedium.copyWith( )),
                                Text('৳${e.serviceCharge}', style: poppinsMedium.copyWith(fontSize: Dimensions.fontSizeSixteen,color: AppColors.textColor)),
                              ],
                            ),
                            SizedBox(height: 4,),
                          ],
                        )).toList(),
                      ),
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Paid Amount :', style: poppinsMedium.copyWith( )),
                          Text('৳ ${userInvoice.paidAmount}', style: poppinsMedium.copyWith(fontSize: Dimensions.fontSizeSixteen,color: AppColors.textColor)),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Discount :', style: poppinsMedium.copyWith( )),
                          Text('৳ ${userInvoice.discount??"N/A"}', style: poppinsMedium.copyWith(fontSize: Dimensions.fontSizeSixteen,color: AppColors.textColor)),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Total Amount :', style: poppinsMedium.copyWith( )),
                          Text('৳ ${userInvoice.totalAmount}', style: poppinsMedium.copyWith(fontSize: Dimensions.fontSizeSixteen,color: AppColors.textColor)),
                        ],
                      ),
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Payment Method :', style: poppinsMedium.copyWith( )),
                          Text('${userInvoice.paymentMethod}', style: poppinsMedium.copyWith(fontSize: Dimensions.fontSizeSixteen,color: AppColors.textColor)),
                        ],
                      ),Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Service Type :', style: poppinsMedium.copyWith( )),
                          Text('${userInvoice.serviceType??"N/A"}', style: poppinsMedium.copyWith(fontSize: Dimensions.fontSizeSixteen,color: AppColors.textColor)),
                        ],
                      ),Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Payment Status :', style: poppinsMedium.copyWith( )),
                          Text('${userInvoice.paymentStatus}', style: poppinsMedium.copyWith(fontSize: Dimensions.fontSizeSixteen,color: AppColors.textColor)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Card(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(Dimensions.radiusTen),
                  ),
                  padding: EdgeInsets.all(Dimensions.paddingSizeTwenty),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Invoice Details', style: poppinsBold.copyWith(fontSize: Dimensions.fontSizeSixteen,color: AppColors.purpleColor)),
                      SizedBox(height: 4,),
                      Text('Details : ${userInvoice.paymentDetails??"N/A"}', style: poppinsMedium.copyWith( )),
                      SizedBox(height: 4,),
                      Text('Note : ${userInvoice.note??"N/A"}', style: poppinsMedium.copyWith( )),
                      SizedBox(height: 4,),
                      Text('Created Date: ${DateFormat('M-d-yyyy').format(DateTime.parse(userInvoice.createdAt.toString()))}', style: poppinsMedium),
                      SizedBox(height: 4,),
                      Text('Payment Date: ${DateFormat('M-d-yyyy').format(DateTime.parse(userInvoice.createdAt.toString()))}', style: poppinsMedium),
                      SizedBox(height: 4,),
                      Text('Payment Date: ${DateFormat('M-d-yyyy').format(DateTime.parse(userInvoice.paymentDate.toString()))}', style: poppinsMedium),

                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
