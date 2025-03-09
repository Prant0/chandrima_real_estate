import 'package:chandrima_real_estate/common/widgets/custom_button.dart';
import 'package:chandrima_real_estate/common/widgets/custom_card.dart';
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
        centerTitle: true,
        title: Text('Invoice Details',style: poppinsBold.copyWith(fontSize: Dimensions.fontSizeTwenty,color: Colors.white),),
        backgroundColor: AppColors.purpleColor,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
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
                                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                                      decoration: BoxDecoration(
                                        color: Colors.green.withOpacity(0.8),
                                        borderRadius: BorderRadius.circular(Dimensions.radiusTen),
                                        border: Border.all(color: Colors.greenAccent,width: 1),
                                      ),
                                      child: Text('${userInvoice.paymentStatus=="null"?"Pending":userInvoice.paymentStatus}'.toUpperCase(), style: poppinsMedium.copyWith(fontSize: Dimensions.fontSizeFourteen,color: Colors.white,)),
                                    ),
                                  ],
                                ),


                              ],
                            ),

                            SizedBox(height: 4,),
                            Text('Invoice Date ',style: poppinsBold.copyWith(fontSize: Dimensions.fontSizeSixteen,color: AppColors.purpleColor)),
                            Text('${DateFormat('d-MM-yyyy').format(DateTime.parse(userInvoice.createdAt.toString()))}', style: poppinsMedium.copyWith(fontSize: Dimensions.fontSizeSixteen,color: AppColors.textColor)),

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
                                Text("${profileController.profileDetails?.data?.member?.name ?? ''}", style: poppinsMedium.copyWith(fontSize: Dimensions.fontSizeSixteen,fontWeight: FontWeight.w700  )),
                                SizedBox(height: 2,),
                                Text("${profileController.profileDetails?.data?.member?.mobile ?? ''}", style: poppinsMedium ),
                                SizedBox(height: 2,),
                                Text("${profileController.profileDetails?.data?.member?.permanentAddress ?? ''}", style: poppinsMedium ),
                                SizedBox(height: 2,),
                                Text("${profileController.profileDetails?.data?.member?.email ?? ''}", style: poppinsMedium  ),
                                SizedBox(height: 2,),
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
                            Divider(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Paid Amount :', style: poppinsMedium.copyWith( )),
                                Text('৳ ${userInvoice.paidAmount}', style: poppinsMedium.copyWith(fontSize: Dimensions.fontSizeSixteen,color: AppColors.textColor)),
                              ],
                            ),
                           /* Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Discount :', style: poppinsMedium.copyWith( )),
                                Text('৳ ${userInvoice.discount??"N/A"}', style: poppinsMedium.copyWith(fontSize: Dimensions.fontSizeSixteen,color: AppColors.textColor)),
                              ],
                            ),*/
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Total Amount :', style: poppinsMedium.copyWith( )),
                                Text('৳ ${userInvoice.totalAmount}', style: poppinsMedium.copyWith(fontSize: Dimensions.fontSizeSixteen,color: AppColors.textColor)),
                              ],
                            ),
                            Divider(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Payment Method :', style: poppinsMedium.copyWith(fontWeight: FontWeight.w800 )),
                                Text('${userInvoice.paymentMethod}', style: poppinsMedium.copyWith(fontSize: Dimensions.fontSizeSixteen,color: AppColors.textColor)),
                              ],
                            ),/*Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Service Type :', style: poppinsMedium.copyWith( )),
                                Text('${userInvoice.serviceType??"N/A"}', style: poppinsMedium.copyWith(fontSize: Dimensions.fontSizeSixteen,color: AppColors.textColor)),
                              ],
                            ),*/Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Payment Status :', style: poppinsMedium.copyWith(fontWeight: FontWeight.w800 )),
                                Text('${userInvoice.paymentStatus=="null"?"N/A":userInvoice.paymentStatus}', style: poppinsMedium.copyWith(fontSize: Dimensions.fontSizeSixteen,color: AppColors.textColor)),
                              ],
                            ),Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Payment Date :', style: poppinsMedium.copyWith(fontWeight: FontWeight.w800 )),
                                Text('${DateFormat('d-MM-yyyy').format(DateTime.parse(userInvoice.paymentDate.toString()))}', style: poppinsMedium.copyWith(fontSize: Dimensions.fontSizeSixteen,color: AppColors.textColor)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    userInvoice.note==null? SizedBox(): Card(
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
                            Text('Note', style: poppinsBold.copyWith(fontSize: Dimensions.fontSizeSixteen,color: AppColors.purpleColor)),
                            SizedBox(height: 4,),
                            /*Text('Details : ${userInvoice.paymentDetails??"N/A"}', style: poppinsMedium.copyWith( )),
                            SizedBox(height: 4,),*/
                            Text('${userInvoice.note??""}', style: poppinsMedium.copyWith( )),
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
          ),
          CustomCard(
            padding: Dimensions.paddingSizeFifteen,
            child: CustomButton(
              color:Color(0xffEE1748),
              //isLoading: profileController.isLoading,
              buttonText: 'Make Payment',
              onPressed: () {
      
              },
            ),
          ),
        ],
      ),
    );
  }
}
