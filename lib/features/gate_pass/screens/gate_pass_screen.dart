import 'package:chandrima_real_estate/common/widgets/custom_app_bar.dart';
import 'package:chandrima_real_estate/features/gate_pass/controller/gate_pass_controller.dart';
import 'package:chandrima_real_estate/features/gate_pass/screens/add_gate_pass_screen.dart';
import 'package:chandrima_real_estate/utils/app_color.dart';
import 'package:chandrima_real_estate/utils/dimensions.dart';
import 'package:chandrima_real_estate/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GatePassScreen extends StatefulWidget {
  const GatePassScreen({super.key});

  @override
  State<GatePassScreen> createState() => _GatePassScreenState();
}

class _GatePassScreenState extends State<GatePassScreen> {
  @override
  void initState() {
    super.initState();
    Get.find<GatePassController>().getGatePassList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Gate Pass'),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => const AddGatePassScreen());
        },
        backgroundColor: AppColors.purpleColor,
        child: const Icon(Icons.add, color: Colors.white),
      ),
      body: GetBuilder<GatePassController>(builder: (gatePassController) {
        return gatePassController.gatePassList != null ? gatePassController.gatePassList!.isNotEmpty ? ListView.builder(
          padding: const EdgeInsets.all(Dimensions.paddingSizeFifteen),
          itemCount: gatePassController.gatePassList!.length,
          itemBuilder: (context, index) {
            var gatePass = gatePassController.gatePassList![index];
            return Container(
              margin: const EdgeInsets.only(bottom: Dimensions.paddingSizeTen),
              padding: const EdgeInsets.all(Dimensions.paddingSizeFifteen),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Gate Pass ID: ${gatePass.gatePassId}', style: poppinsBold),
                  Text('Visitor Name: ${gatePass.visitorName}', style: poppinsMedium),
                  Text('Phone: ${gatePass.visitorPhone}', style: poppinsMedium),
                  Text('Address: ${gatePass.visitorAddress}', style: poppinsMedium),
                  Text('Purpose: ${gatePass.visitPurpose}', style: poppinsMedium),
                  Text('Entry Date: ${getFormattedDate(gatePass.entryDate!)}', style: poppinsMedium),
                  Text('Expiry Date: ${getFormattedDate(gatePass.expiredDate!)}', style: poppinsMedium),
                  Text(
                    'Status: ${gatePass.status}',
                    style: poppinsRegular.copyWith(
                      fontWeight: FontWeight.bold,
                      color: gatePass.status == 'approve' ? Colors.green : gatePass.status == 'pending' ? Colors.orange : Colors.red,
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () {
                          gatePassController.deleteGatePass(gatePassId: gatePass.id!);
                        },
                        icon: const Icon(Icons.delete, color: AppColors.red),
                      ),

                      IconButton(
                        onPressed: () {
                          gatePassController.downloadGatePass(gatePassId: gatePass.id!);
                        },
                        icon: const Icon(Icons.download, color: AppColors.purpleColor),
                      ),
                    ],
                  ),

                ],
              ),
            );
          },
        ) : const Center(child: Text('No data found')) : const Center(child: CircularProgressIndicator());
      }),
    );
  }

  String getFormattedDate(String date) {
    return date.split(' ')[0];
  }

}
