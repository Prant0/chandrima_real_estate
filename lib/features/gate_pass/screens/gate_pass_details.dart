import 'package:chandrima_real_estate/common/widgets/custom_app_bar.dart';
import 'package:chandrima_real_estate/features/gate_pass/model/gate_pass_list_model.dart';
import 'package:chandrima_real_estate/utils/dimensions.dart';
import 'package:chandrima_real_estate/utils/styles.dart';
import 'package:flutter/material.dart';


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
                CustomRichText(title: 'Gate Pass ID', value: widget.gatePassData.id.toString()),
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
            CustomRichText(title: 'Visit Purpose', value: widget.gatePassData.visitPurpose.toString()),
            CustomRichText(title: 'Entry Date', value: getFormattedDate(widget.gatePassData.entryDate!)),
            CustomRichText(title: 'Expiry Date', value: getFormattedDate(widget.gatePassData.expiredDate!)),
            CustomRichText(title: 'Gate Pass Type', value: widget.gatePassData.gatepassType.toString()),
            CustomRichText(title: 'Reference Type', value: widget.gatePassData.referenceType.toString()),
            CustomRichText(title: 'Vehicle Type', value: widget.gatePassData.vehicleType.toString()),
            CustomRichText(title: 'Vehicle Number', value: widget.gatePassData.vehicleNumber.toString()),
            CustomRichText(title: 'Vehicle Model', value: widget.gatePassData.vehicleModel.toString()),
            CustomRichText(title: 'Driving Licence No', value: widget.gatePassData.drivingLicense.toString()),
            CustomRichText(title: 'Payment Method', value: widget.gatePassData.paymentMethod.toString()),
            CustomRichText(title: 'Payment Status', value: widget.gatePassData.paymentStatus.toString()),





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
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: RichText(
        text: TextSpan(
          text: '$title : ',
          style: poppinsMedium.copyWith(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 17),
          children: <TextSpan>[
            TextSpan(
              text: "${value.toString()}",
              style: poppinsMedium.copyWith(fontWeight: FontWeight.bold,color: Colors.black54,fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
