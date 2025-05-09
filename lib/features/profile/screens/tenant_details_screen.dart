import 'dart:io';

import 'package:chandrima_real_estate/common/widgets/custom_app_bar.dart';
import 'package:chandrima_real_estate/features/complain/screens/complain_details_screen.dart';
import 'package:chandrima_real_estate/features/profile/models/tenant_model.dart';
import 'package:chandrima_real_estate/utils/app_color.dart';
import 'package:chandrima_real_estate/utils/dimensions.dart';
import 'package:chandrima_real_estate/utils/styles.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';


class TenantDetailsScreen extends StatelessWidget {
    TenantDetailsScreen({super.key, required this.tenants});
  TenantModel tenants;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: "Tenant Details", backButton: true),
      body: Container(

        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Center(
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(Dimensions.radiusFive),
                    child: Image.network(tenants.photo ?? '',height: 100,width: 100,)),
              ),
              SizedBox(height: 20,),
              buildDetailRow('Tenant ID :', tenants.tenantId??"N/A"),
              buildDetailRow('Name :', tenants.name),
              buildDetailRow('Status :', tenants.status),
              buildDetailRow('Gender :', tenants.gender??"N/A"),
              buildDetailRow('Mobile No :', tenants.mobile),
             // buildDetailRow('Email :', tenants.email),
              // buildDetailRow('Relation :', tenants.re),
              buildDetailRow('Flat No :', tenants.flatNo??"N/A"),
            //  buildDetailRow('Advance Rent :', tenants.advanceRent??"N/A"),
              buildDetailRow('Rent From :', "${tenants.rentPerMonth??""} ${tenants.rentYear??"N/A"}"),
             // buildDetailRow('Rent Per Month :', tenants.rentPerMonth??"N/A"),
              // buildDetailRow('Address :', tenants.permanentAddress??"N/A"),
              buildDetailRow('PePrevious Address :', tenants.previousAddress??"N/A"),
              buildDetailRow('Permanent Address :', tenants.permanentAddress??"N/A"),
              buildDetailRow('Reference Details :', tenants.refDetails??"N/A"),
              buildDetailRow('NID Number :', tenants.nidNumber??"N/A"),

              tenants.nidImage!=null?Center(
                child: Text("NID Image",style: poppinsSemiMedium.copyWith(fontSize: Dimensions.fontSizeEighteen),),
              ):SizedBox(height: 0,),
              SizedBox(height: 20,),

               SizedBox(
                 height: 120,
                 child: Center(
                   child: ListView.builder(
                       scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                      itemCount: tenants.nidImage!.length,
                       itemBuilder: (context,index){
                     return InkWell(
                       onTap: (){
                         Get.to(() => FullScreenImage(
                           image: "https://app.chandrimarpl.com/upload/members/documents/${tenants.nidImage?[index]}",
                         ));
                       },
                       child: Padding(
                         padding: const EdgeInsets.only(right: 20),
                         child: ClipRRect(
                             borderRadius: BorderRadius.circular(Dimensions.radiusFive),
                             child: Image.network("https://app.chandrimarpl.com/upload/members/documents/${tenants.nidImage?[index]}",)),
                       ),
                     );
                   }),
                 ),
               ),



              SizedBox(height: 20,),
              Text("Documents",style: poppinsBold.copyWith(fontSize: Dimensions.fontSizeEighteen,color: AppColors.primary),),
              SizedBox(height: 10,),
              tenants.documents!=null?ListView.builder(
                shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: tenants.documents!.length,
                  itemBuilder: (context,index){
                    var data=tenants.documents![index];
                return Container(
                 decoration: BoxDecoration(
                    color: AppColors.grey.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(Dimensions.radiusTen),
                    boxShadow:  [BoxShadow(color: Colors.black12, spreadRadius: 0.5, blurRadius: 5)],
                  ),
                  padding: EdgeInsets.all(Dimensions.paddingSizeFifteen),
                  margin: EdgeInsets.only(bottom: Dimensions.paddingSizeFifteen
                 ),
                  child: Column(
                    children: [
                      Text('Document Title: ${data.documentTitle}',style: poppinsSemiMedium.copyWith(fontSize: Dimensions.fontSizeEighteen),),
                      SizedBox(height: 10,),
                      data.documentFile!=null? ListView.builder(
                        shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                        itemCount:  data.documentFile!.length,
                          itemBuilder:(context,index){
                        return Column(
                          children: [
                            InkWell(
                              onTap: () => openDocumentInBrowser( "${data.documentPath}/${data.documentFile?[index]}"),
                              child: Text(
                                "${index+1}=> ${data.documentTitle.toString()}",
                                style: TextStyle(color: Colors.blue, decoration: TextDecoration.underline),
                              ),
                            ),
                            SizedBox(height: 10,),
                          ],
                        );
                      }):SizedBox()
                    ],
                  ),
                );
              }):SizedBox()
              
              


              // buildDetailRow('NID :', jsonDecode(tenants.nidImage?.replaceAll('[', '').replaceAll(']', '') ?? "N/A")),



            ],
          ),
        ),
      ),
    );
  }

}
Widget buildDetailRow(String title, String? value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 2),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$title  ', style: poppinsRegular.copyWith(color: Colors.black87.withValues(alpha: 0.7),fontWeight: FontWeight.bold),
        ),
        Expanded(
          child: Text(value ?? 'N/A', style: poppinsRegular.copyWith(color: Colors.black54), overflow: TextOverflow.ellipsis, maxLines: 1),
        ),
      ],
    ),
  );
}
Future<void> downloadDocument(BuildContext context,String title,value) async {
  try {
    // Get the directory to save the file
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String savePath = '${appDocDir.path}/$title';

    // Download the file
    Dio dio = Dio();
    await dio.download(value, savePath);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Document downloaded to $savePath')),
    );
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Failed to download document: $e')),
    );
  }
}

Future<void> openDocumentInBrowser(String documentUrl) async {
  final Uri url = Uri.parse(documentUrl);
  if (await canLaunchUrl(url)) {
    await launchUrl(url, mode: LaunchMode.externalApplication);
  } else {
    throw 'Could not launch $documentUrl';
  }
}
