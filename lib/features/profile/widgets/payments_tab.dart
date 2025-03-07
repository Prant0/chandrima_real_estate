import 'package:chandrima_real_estate/common/widgets/custom_card.dart';
import 'package:chandrima_real_estate/common/widgets/custom_network_image.dart';
import 'package:chandrima_real_estate/features/gate_pass/screens/gate_pass_details.dart';
import 'package:chandrima_real_estate/features/profile/controller/profile_controller.dart';
import 'package:chandrima_real_estate/routes/routes_name.dart';
import 'package:chandrima_real_estate/utils/app_color.dart';
import 'package:chandrima_real_estate/utils/dimensions.dart';
import 'package:chandrima_real_estate/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class PaymentsTab extends StatelessWidget {
  const PaymentsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(builder: (profileController) {
      final payment = profileController.profileDetails?.data?.payments;

      return Column(
        children: [
          payment != null && payment.isNotEmpty ? Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(Dimensions.paddingSizeFifteen),
              itemCount: payment.length,
              itemBuilder: (context, index) {
                final payments = payment[index];

                return CustomCard(
                  margin: EdgeInsets.only(bottom: index == payment.length - 1 ? 0 : Dimensions.paddingSizeFifteen),
                  child:  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CustomRichText(title: 'Sl No:', value: (index + 1).toString()),

                        ],
                      ),
                      CustomRichText(title: 'Invoice Id:', value: payments.invoiceId??"N/A"),
                      CustomRichText(title: 'Date:', value: DateFormat('dd-MM-yyyy').format(payments.paymentDate!)),


                      Text("Services", style: poppinsRegular.copyWith(color: AppColors.primary,fontWeight: FontWeight.w800,fontSize: 16),),

                      ListView.builder(
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              Text((index + 1).toString() + ". ", style: poppinsRegular.copyWith(color: AppColors.grey,fontSize: 16,fontWeight: FontWeight.w700),),
                              Text(payments.services![index].serviceName.toString(), style: poppinsRegular.copyWith(color:Colors.black54,fontSize: 16,fontWeight: FontWeight.w700),),
                              Spacer(),
                              Text("${payments.services![index].serviceCharge} Tk", style: poppinsRegular.copyWith(color:Colors.black54,fontSize: 16,fontWeight: FontWeight.w700),),
                            ],
                          );
                        }, itemCount: payments.services!.length, shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),),


                      CustomRichText(title: 'Total Amount:', value: payments.totalAmount.toString()),
                      CustomRichText(title: 'Paid Amount:', value: payments.paidAmount.toString()),
                      CustomRichText(title: 'Due Amount:', value: (payments.totalAmount! - payments.paidAmount!).toString()),


                    ],
                  ),
                );
              },
            ),
          ) : const Expanded(child: Center(child: Text("No tenant information available."))),


        ],
      );
    });
  }

  Widget buildDetailRow(String title, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text(
            '$title ', style: poppinsRegular.copyWith(color: AppColors.grey),
          ),
          Expanded(
            child: Text(value ?? 'N/A', style: poppinsRegular.copyWith(color: AppColors.grey), overflow: TextOverflow.ellipsis, maxLines: 1),
          ),
        ],
      ),
    );
  }

}