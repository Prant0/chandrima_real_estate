import 'dart:io';
import 'package:chandrima_real_estate/common/widgets/custom_app_bar.dart';
import 'package:chandrima_real_estate/common/widgets/custom_button.dart';
import 'package:chandrima_real_estate/common/widgets/custom_drop_down_button.dart';
import 'package:chandrima_real_estate/common/widgets/custom_network_image.dart';
import 'package:chandrima_real_estate/common/widgets/custom_snackbar.dart';
import 'package:chandrima_real_estate/common/widgets/custom_text_field.dart';
import 'package:chandrima_real_estate/features/gate_pass/controller/gate_pass_controller.dart';
import 'package:chandrima_real_estate/features/gate_pass/screens/gate_pass_form_screen.dart';
import 'package:chandrima_real_estate/utils/app_color.dart';
import 'package:chandrima_real_estate/utils/dimensions.dart';
import 'package:chandrima_real_estate/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AddGatePassScreen extends StatelessWidget {
  const AddGatePassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Add Gate Pass'),
      body: GetBuilder<GatePassController>(builder: (gatePassController) {
        return gatePassController.isLoading ? Center(
            child: CircularProgressIndicator()) : Column(
          children: [
            SizedBox(height: 30,),
            GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 0,
              childAspectRatio: 1.2
            ),
                itemCount:gatePassController.gatePassTypeModel!.data!.gatepassTypes!.length,
                shrinkWrap: true,
                itemBuilder: (context,index){
              var data=gatePassController.gatePassTypeModel!.data!.gatepassTypes![index];
                  return InkWell(
                    onTap: (){

                      Get.off(() => GatePassFormScreen(gatePassType: data.name));
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      padding: EdgeInsets.only(top: 14),
                      decoration: BoxDecoration(
                        color: AppColors.white,
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
                        children: [
                           SvgPicture.network(data.icon!,height: 100,width: 100,),
                          SizedBox(height: 10,),
                          Text("${data.name}",style: poppinsRegular.copyWith(color: AppColors.primary,fontSize: 20,fontWeight: FontWeight.w800),),
                        ],
                      ),
                    ),
                  );
                })
          ],
        );
      }),
    );
  }
}