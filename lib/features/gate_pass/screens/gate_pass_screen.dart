import 'package:chandrima_real_estate/common/widgets/custom_app_bar.dart';
import 'package:chandrima_real_estate/features/gate_pass/controller/gate_pass_controller.dart';
import 'package:chandrima_real_estate/features/gate_pass/screens/add_gate_pass_screen.dart';
import 'package:chandrima_real_estate/features/gate_pass/screens/gate_pass_details.dart';
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
    Get.find<GatePassController>().getGatePassType();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:   CustomAppBar(title: 'Gate Pass',),
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
            return GestureDetector(
              onTap: () {
                Get.to(() => GatePassDetails(gatePassData: gatePass));
              },
              child: Container(
                margin: const EdgeInsets.only(bottom: Dimensions.paddingSizeTen),
                padding: const EdgeInsets.all(Dimensions.paddingSizeFifteen),
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text('Gate Pass ID: ${gatePass.gatePassId}', style: poppinsBold),
                        Spacer(),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeTen, vertical: Dimensions.paddingSizeFive),
                          decoration: BoxDecoration(
                            color: gatePass.status == 'approve' ? Colors.green : gatePass.status == 'pending' ? Colors.orange : Colors.red,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Text(gatePass.status.toString(), style: poppinsRegular.copyWith(color: Colors.white)),
                        )
                      ],
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'Type: ',
                        style: poppinsRegular.copyWith(fontSize: Dimensions.fontSizeSixteen, color: AppColors.primary,fontWeight: FontWeight.w800),
                        children: <TextSpan>[
                          TextSpan(
                            text: '${gatePass.gatepassType}',
                            style: poppinsMedium.copyWith(fontSize: Dimensions.fontSizeSixteen,color: AppColors.black),
                          ),
                        ],
                      ),
                    ),RichText(
                      text: TextSpan(
                        text: 'Name: ',
                        style: poppinsRegular.copyWith(fontSize: Dimensions.fontSizeSixteen, color: AppColors.primary,fontWeight: FontWeight.w800),
                        children: <TextSpan>[
                          TextSpan(
                            text: '${gatePass.visitorName}',
                            style: poppinsMedium.copyWith(fontSize: Dimensions.fontSizeSixteen,color: AppColors.black),
                          ),
                        ],
                      ),
                    ),RichText(
                      text: TextSpan(
                        text: 'Phone: ',
                        style: poppinsRegular.copyWith(fontSize: Dimensions.fontSizeSixteen, color: AppColors.primary,fontWeight: FontWeight.w800),
                        children: <TextSpan>[
                          TextSpan(
                            text: '${gatePass.visitorPhone}',
                            style: poppinsMedium.copyWith(fontSize: Dimensions.fontSizeSixteen,color: AppColors.black),
                          ),
                        ],
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'Address: ',
                        style: poppinsRegular.copyWith(fontSize: Dimensions.fontSizeSixteen, color: AppColors.primary,fontWeight: FontWeight.w800),
                        children: <TextSpan>[
                          TextSpan(
                            text: '${gatePass.visitorAddress}',
                            style: poppinsMedium.copyWith(fontSize: Dimensions.fontSizeSixteen,color: AppColors.black),
                          ),
                        ],
                      ),),

                    gatePass.visitPurpose==null?SizedBox(): RichText(
                      text: TextSpan(
                        text: 'Purpose: ',
                        style: poppinsRegular.copyWith(fontSize: Dimensions.fontSizeSixteen, color: AppColors.primary,fontWeight: FontWeight.w800),
                        children: <TextSpan>[
                          TextSpan(
                            text: '${gatePass.visitPurpose}',
                            style: poppinsMedium.copyWith(fontSize: Dimensions.fontSizeSixteen,color: AppColors.black),
                          ),
                        ],
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'Entry Date: ',
                        style: poppinsRegular.copyWith(fontSize: Dimensions.fontSizeSixteen, color: AppColors.primary,fontWeight: FontWeight.w800),
                        children: <TextSpan>[
                          TextSpan(
                            text: '${getFormattedDate(gatePass.entryDate!.toString())}',
                            style: poppinsMedium.copyWith(fontSize: Dimensions.fontSizeSixteen,color: AppColors.black),
                          ),
                        ],
                      ),),

                    RichText(
                      text: TextSpan(
                        text: 'Expiry Date: ',
                        style: poppinsRegular.copyWith(fontSize: Dimensions.fontSizeSixteen, color: AppColors.primary,fontWeight: FontWeight.w800),
                        children: <TextSpan>[
                          TextSpan(
                            text: '${getFormattedDate(gatePass.expiredDate!.toString())}',
                            style: poppinsMedium.copyWith(fontSize: Dimensions.fontSizeSixteen,color: AppColors.black),
                          ),
                        ],
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Delete Gate Pass'),
                                  content: const Text('Are you sure you want to delete this gate pass?'),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('Cancel'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                         gatePassController.deleteGatePass(gatePassId: gatePass.id!);
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('Delete'),
                                    ),
                                  ],
                                );
                              },
                            );
                           // gatePassController.deleteGatePass(gatePassId: gatePass.id!);
                          },
                          icon: const Icon(Icons.delete_sweep_sharp, color: AppColors.red,size: 33,),
                        ),

                        SizedBox(width: 10,),
                        IconButton(
                          onPressed: () {
                            if (gatePass.status == 'pending') {
                              Get.snackbar('Error', 'Cannot download gate pass with pending status', backgroundColor: Colors.red, colorText: Colors.white);
                            } else {
                              gatePassController.downloadGatePass(gatePassId: gatePass.id!);
                            }
                            //gatePassController.downloadGatePass(gatePassId: gatePass.id!);
                          },
                          icon: const Icon(Icons.download, color: AppColors.purpleColor,size: 33,),
                        ),
                      ],
                    ),

                  ],
                ),
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
