import 'package:chandrima_real_estate/common/widgets/custom_button.dart';
import 'package:chandrima_real_estate/common/widgets/custom_card.dart';
import 'package:chandrima_real_estate/common/widgets/custom_network_image.dart';
import 'package:chandrima_real_estate/features/complain/screens/complain_details_screen.dart';
import 'package:chandrima_real_estate/features/profile/controller/profile_controller.dart';
import 'package:chandrima_real_estate/routes/routes_name.dart';
import 'package:chandrima_real_estate/utils/app_color.dart';
import 'package:chandrima_real_estate/utils/dimensions.dart';
import 'package:chandrima_real_estate/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FamilyMemberTab extends StatelessWidget {
  const FamilyMemberTab({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(builder: (profileController) {
      final familyMember = profileController.profileDetails?.data?.familyMembers;
      return Column(
        children: [
          familyMember != null && familyMember.isNotEmpty ? Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(Dimensions.paddingSizeFifteen),
              itemCount: familyMember.length,
              itemBuilder: (context, index) {
                final familyMembers = familyMember[index];

                return CustomCard(
                  margin: EdgeInsets.only(bottom: index == familyMember.length - 1 ? 0 : Dimensions.paddingSizeFifteen),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(Dimensions.radiusFive),
                          child: CustomNetworkImage(
                            image: familyMembers.photo ?? '',
                            width: 100, height: 105,
                          ),
                        ),
                        const SizedBox(width: 10),

                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              buildDetailRow('Family Id :', familyMembers.familyId??"N/A"),
                              buildDetailRow('Name :', familyMembers.name),
                              buildDetailRow('Mobile No :', familyMembers.mobile),
                              buildDetailRow('Relation :', familyMembers.relation),
                              buildDetailRow('Gender :', familyMembers.gender),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  InkWell(
                                      onTap: (){
                                        showDialog(context: context, builder: (context){
                                          return Dialog(
                                            backgroundColor: Colors.white,
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(20.0)
                                            ),
                                            child: Container(
                                              padding: EdgeInsets.all(20),
                                              height: MediaQuery.of(context).size.height*0.6,
                                              width: MediaQuery.of(context).size.width*0.8,
                                              child: SingleChildScrollView(
                                                physics: BouncingScrollPhysics(),
                                                child: Column(
                                                  children: [
                                                    Text("Family Member Details",style: poppinsRegular.copyWith(color: Colors.black87,fontWeight: FontWeight.bold,fontSize: 20),),
                                                    SizedBox(height: 20,),
                                                    ClipRRect(
                                                        borderRadius: BorderRadius.circular(Dimensions.radiusFive),
                                                        child: CustomNetworkImage(image:familyMembers.photo ?? '',height: 100,width: 100,)),
                                                    SizedBox(height: 20,),
                                                    buildDetailRow('Family ID :', familyMembers.familyId??"N/A"),
                                                    buildDetailRow('Member ID :', familyMembers.memberId??"N/A"),
                                                    buildDetailRow('Name :', familyMembers.name),
                                                    buildDetailRow('Mobile No :', familyMembers.mobile),
                                                    buildDetailRow('Email :', familyMembers.email),
                                                    buildDetailRow('Gender :', familyMembers.gender??"N/A"),
                                                    buildDetailRow('Birthday :', familyMembers.birthday??"N/A"),
                                                    buildDetailRow('NID Number :', familyMembers.nidImage??"N/A"),
                                                    buildDetailRow('Relation :', familyMembers.relation??"N/A"),
                                                    buildDetailRow('Address :', familyMembers.address??"N/a"),
                                                    buildDetailRow('ID Card Status :', familyMembers.id_card_status??"N/a"),

                                                    familyMembers.nidImage!=null?  buildDetailRow("NID Image : ",""):SizedBox(height: 0,),

                                                    familyMembers.nidImage!=null? InkWell(
                                                      onTap: (){
                                                        Get.to(() => FullScreenImage(
                                                          image: "https://app.chandrimarpl.com/upload/members/documents/${familyMembers.nidImage![0]}",
                                                        ));
                                                      },
                                                      child: ClipRRect(
                                                          borderRadius: BorderRadius.circular(Dimensions.radiusFive),
                                                          child: Image.network("https://app.chandrimarpl.com/upload/members/documents/${familyMembers.nidImage![0]}",height: 100,width: 100,)),
                                                    ):SizedBox(height: 0,),
                                                    SizedBox(height: 12,),

                                                    familyMembers.id_card_status==null || familyMembers.id_card_status=="reject"?CustomButton(

                                                        onPressed: () {
                                                          showDialog(
                                                            context: context,
                                                            builder: (context) {
                                                              TextEditingController textController = TextEditingController();
                                                              return AlertDialog(
                                                                title: Text('Enter Details'),
                                                                content: TextField(
                                                                  controller: textController,
                                                                  decoration: InputDecoration(hintText: "Enter details here"),
                                                                ),
                                                                actions: [
                                                                  TextButton(
                                                                    onPressed: () {
                                                                      // Handle the text input
                                                                      String enteredText = textController.text;
                                                                      profileController.requestFamilyIDCard(id: familyMembers.id.toString() ?? '', details: enteredText);
                                                                      Navigator.of(context).pop();
                                                                    },
                                                                    child: Text('Submit'),
                                                                  ),
                                                                  TextButton(
                                                                    onPressed: () {
                                                                      Navigator.of(context).pop();
                                                                    },
                                                                    child: Text('Cancel'),
                                                                  ),
                                                                ],
                                                              );
                                                            },
                                                          );
                                                        },
                                                        buttonText: "Request for ID Card"):SizedBox(height: 0,),


                                                    // buildDetailRow('NID :', jsonDecode(tenants.nidImage?.replaceAll('[', '').replaceAll(']', '') ?? "N/A")),



                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        });
                                      },
                                 child: Icon(Icons.remove_red_eye_outlined,color: Colors.blue,size: 25,)),
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
                                            title: const Text('Delete Family Member'),
                                            content: const Text('Are you sure you want to delete this Family Member?'),
                                            actions: <Widget>[
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: const Text('Cancel'),
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  profileController.deleteFamilyMember(id: familyMembers.id!,index: index);
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
                );
              },
            ),
          ) : const Expanded(child: Center(child: Text("No Family Member available."))),

          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(Dimensions.paddingSizeTen),
              child: FloatingActionButton(
                onPressed: () {
                  Get.toNamed(RoutesName.getAddFamilyMemberScreen());
                },
                backgroundColor: AppColors.primary,
                child: const Icon(Icons.add, color: AppColors.white),
              ),
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
            '$title ', style: poppinsRegular.copyWith(color: Colors.black87.withOpacity(0.7),fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: Text(value ?? 'N/A', style: poppinsRegular.copyWith(color:Colors.black54), overflow: TextOverflow.ellipsis, maxLines: 1),
          ),
        ],
      ),
    );
  }

}