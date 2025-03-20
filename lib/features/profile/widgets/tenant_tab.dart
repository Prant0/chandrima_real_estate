import 'dart:convert';

import 'package:chandrima_real_estate/common/widgets/custom_card.dart';
import 'package:chandrima_real_estate/common/widgets/custom_network_image.dart';
import 'package:chandrima_real_estate/features/complain/screens/complain_details_screen.dart';
import 'package:chandrima_real_estate/features/profile/controller/profile_controller.dart';
import 'package:chandrima_real_estate/features/profile/models/profile_model.dart';
import 'package:chandrima_real_estate/routes/routes_name.dart';
import 'package:chandrima_real_estate/utils/app_color.dart';
import 'package:chandrima_real_estate/utils/dimensions.dart';
import 'package:chandrima_real_estate/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TenantTab extends StatelessWidget {
  const TenantTab({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(builder: (profileController) {
      final tenant = profileController.profileDetails?.data?.tenants;

      return Stack(
        children: [
          tenant != null && tenant.isNotEmpty ? ListView.builder(
            padding: const EdgeInsets.all(Dimensions.paddingSizeFifteen),
            itemCount: tenant.length,
            itemBuilder: (context, index) {
              final tenants = tenant[index];

              return InkWell(
                onTap: (){
                  showTenantDetails(context,tenants);
                },
                child: CustomCard(

                  margin: EdgeInsets.only(bottom: index == tenant.length - 1 ? 0 : Dimensions.paddingSizeFifteen),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Row(children: [

                        ClipRRect(
                          borderRadius: BorderRadius.circular(Dimensions.radiusFive),
                          child: CustomNetworkImage(
                            image: tenants.photo ?? '',
                            width: 100, height: 105,
                          ),
                        ),
                        const SizedBox(width: 10),

                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              buildDetailRow('Tenant ID :', tenants.tenantId??"N/A"),
                              buildDetailRow('Name :', tenants.name),
                              buildDetailRow('Mobile No :', tenants.mobile),
                              buildDetailRow('Flat No :', tenants.flatNo),
                              buildDetailRow('Address :', tenants.address),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  InkWell(onTap: (){
                                    showTenantDetails(context,tenants);
                                  }, child: Icon(Icons.remove_red_eye_outlined,color: Colors.blue,size: 25,)),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 16),
                                    child: InkWell(onTap: (){}, child: Icon(Icons.edit,color: Colors.blue,size: 25,)),
                                  ),
                                  InkWell(
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: const Text('Delete Tenant'),
                                              content: const Text('Are you sure you want to delete this Tenant?'),
                                              actions: <Widget>[
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: const Text('Cancel'),
                                                ),
                                                TextButton(
                                                  onPressed: () {
                                                  profileController.deleteTenantMember(id: tenants.id!,index: index);
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
                                      child: Icon(Icons.delete_outline,color: Colors.red,size: 25,)),

                                ],
                              )
                            ],
                          ),
                        ),
                      ]),

                    ],
                  ),
                ),
              );
            },
          ) : const Expanded(child: Center(child: Text("No tenant information available."))),

          Positioned(
             bottom: 25,
            right: 22,
            child: Column(
              children: [
                FloatingActionButton(
                  onPressed: () {
                    profileController.downloadTenantInfo();
                  },
                  backgroundColor: AppColors.primary,
                  child: const Icon(Icons.download, color: AppColors.white),
                ),
                SizedBox(height: 16,),
                FloatingActionButton(
                  onPressed: () {
                    Get.toNamed(RoutesName.getAddTenantScreen());
                  },
                  backgroundColor: AppColors.primary,
                  child: const Icon(Icons.add_circle, color: AppColors.white),
                ),
              ],
            ),
          ),
        ],
      );
    });
  }

  Widget buildDetailRow(String title, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$title  ', style: poppinsRegular.copyWith(color: Colors.black87.withOpacity(0.7),fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: Text(value ?? 'N/A', style: poppinsRegular.copyWith(color: Colors.black54), overflow: TextOverflow.ellipsis, maxLines: 1),
          ),
        ],
      ),
    );
  }

    showTenantDetails(BuildContext context,Tenants tenants){
    return showDialog(context: context, builder: (context){
      return Dialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0)
        ),
        child: Container(
          padding: EdgeInsets.all(20),
          height: MediaQuery.of(context).size.height*0.7,
          width: MediaQuery.of(context).size.width*0.8,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text("Tenant Details",style: poppinsRegular.copyWith(color: Colors.black87,fontWeight: FontWeight.bold,fontSize: 20),),
                Text("Tenant Details",style: poppinsRegular.copyWith(color: Colors.black87,fontWeight: FontWeight.bold,fontSize: 20),),
                SizedBox(height: 20,),
                ClipRRect(
                    borderRadius: BorderRadius.circular(Dimensions.radiusFive),
                    child: Image.network(tenants.photo ?? '',height: 100,width: 100,)),
                SizedBox(height: 20,),
                buildDetailRow('Tenant ID :', tenants.tenantId??"N/A"),
                buildDetailRow('Name :', tenants.name),
                buildDetailRow('Status :', tenants.status),
                buildDetailRow('Mobile No :', tenants.mobile),
                buildDetailRow('Email :', tenants.email),
                // buildDetailRow('Relation :', tenants.re),
                buildDetailRow('Flat No :', tenants.flatNo),
                buildDetailRow('Advance Rent :', tenants.advanceRent??"N/A"),
                buildDetailRow('Rent From :', "${tenants.rentPerMonth??""} ${tenants.rentYear??"N/A"}"),
                buildDetailRow('Rent Per Month :', tenants.rentPerMonth??"N/A"),
                buildDetailRow('Address :', tenants.address??"N/A"),
                buildDetailRow('Permanent Address :', tenants.permanent_address??"N/A"),
                tenants.nidImage!=null?  buildDetailRow("NID Image : ",""):SizedBox(height: 0,),

                tenants.nidImage!=null? InkWell(
                  onTap: (){
                    Get.to(() => FullScreenImage(
                      image: "https://app.chandrimarpl.com/upload/members/documents/${tenants.nidImage[0]}",
                    ));
                  },
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(Dimensions.radiusFive),
                      child: Image.network("https://app.chandrimarpl.com/upload/members/documents/${tenants.nidImage[0]}",height: 100,width: 100,)),
                ):SizedBox(height: 0,),


                // buildDetailRow('NID :', jsonDecode(tenants.nidImage?.replaceAll('[', '').replaceAll(']', '') ?? "N/A")),



              ],
            ),
          ),
        ),
      );
    });
  }

}