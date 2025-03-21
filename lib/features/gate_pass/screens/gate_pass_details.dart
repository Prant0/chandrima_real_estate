import 'package:chandrima_real_estate/common/widgets/custom_app_bar.dart';
import 'package:chandrima_real_estate/common/widgets/custom_network_image.dart';
import 'package:chandrima_real_estate/features/complain/screens/complain_details_screen.dart';
import 'package:chandrima_real_estate/features/gate_pass/model/gate_pass_list_model.dart';
import 'package:chandrima_real_estate/utils/app_color.dart';
import 'package:chandrima_real_estate/utils/dimensions.dart';
import 'package:chandrima_real_estate/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class GatePassDetails extends StatefulWidget {
    GatePassDetails({super.key, required this.gatePassData});
  GatePassData gatePassData;

  @override
  State<GatePassDetails> createState() => _GatePassDetailsState();
}

class _GatePassDetailsState extends State<GatePassDetails> {
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
       appBar:  CustomAppBar(title: 'Gate Pass Details',),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CustomRichText(title: 'Gate Pass ID', value: widget.gatePassData.gatePassId.toString()),
                  Spacer(),
                Container(
                  padding:   EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeTen, vertical: Dimensions.paddingSizeFive),
                  decoration: BoxDecoration(
                    color: widget.gatePassData.status == 'approve' ? Colors.green : widget.gatePassData.status == 'pending' ? Colors.orange : Colors.red,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(widget.gatePassData.status.toString(), style: poppinsRegular.copyWith(color: Colors.white)),
                )
              ],
            ),
            CustomRichText(title: 'Visitor Name', value: widget.gatePassData.visitorName.toString()),
            CustomRichText(title: 'Phone', value: widget.gatePassData.visitorPhone.toString()),
            CustomRichText(title: 'Address', value: widget.gatePassData.visitorAddress.toString()),
            widget.gatePassData.visitPurpose!=null? CustomRichText(title: 'Visit Purpose', value: widget.gatePassData.visitPurpose.toString()):Container(),
            CustomRichText(title: 'Entry Date', value: getFormattedDate(widget.gatePassData.entryDate!.toString())),
            CustomRichText(title: 'Expiry Date', value: getFormattedDate(widget.gatePassData.expiredDate!.toString())),
            CustomRichText(title: 'Gate Pass Type', value: widget.gatePassData.gatepassType.toString()),
            CustomRichText(title: 'Reference Type', value: widget.gatePassData.referenceType.toString()),
            widget.gatePassData.vehicleType!=null? CustomRichText(title: 'Vehicle Type', value: widget.gatePassData.vehicleType.toString()):Container(),
            widget.gatePassData.vehicleNumber!=null? CustomRichText(title: 'Vehicle Number', value: widget.gatePassData.vehicleNumber.toString()):Container(),
            widget.gatePassData.vehicleModel!=null? CustomRichText(title: 'Vehicle Model', value: widget.gatePassData.vehicleModel.toString()):Container(),
            widget.gatePassData.paymentMethod!=null? CustomRichText(title: 'Payment Method', value: widget.gatePassData.paymentMethod.toString()):Container(),
            CustomRichText(title: 'Payment Status', value: widget.gatePassData.paymentStatus.toString()),

            SizedBox(height: 20),
            Text("Payment Documents", style: poppinsMedium.copyWith(fontSize: 18,fontWeight: FontWeight.w800)),
            SizedBox(height: 20),
            GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 1
            ),
                itemCount: widget.gatePassData.paymentDocuments!.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: (){
                        Get.to(() => FullScreenImage(image: "${widget.gatePassData.documentPath}/${widget.gatePassData.paymentDocuments![index]}"));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withValues(alpha: 0.5),
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child:CustomNetworkImage(image: "${widget.gatePassData.documentPath}/${widget.gatePassData.paymentDocuments![index]}"),
                    ),
                  );
                },)





          ],
    ),
      ),
    );
  }
  String getFormattedDate(String date) {
    return date.split(' ')[0];
  }
}

class CustomRichText extends StatelessWidget {
    CustomRichText({
    super.key,
      required this.title,required this.value
  });
  String title, value;



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: RichText(
        text: TextSpan(
          text: '$title : ',
          style: poppinsMedium.copyWith(color: AppColors.primary,fontWeight: FontWeight.w800,fontSize: 16),
          children: <TextSpan>[
            TextSpan(
              text: "${value.toString()}",
              style: poppinsMedium.copyWith(fontWeight: FontWeight.w800,color: Colors.black54,fontSize: 17),
            ),
          ],
        ),
      ),
    );
  }
}
