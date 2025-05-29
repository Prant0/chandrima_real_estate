import 'package:chandrima_real_estate/common/widgets/custom_card.dart';
import 'package:chandrima_real_estate/common/widgets/custom_network_image.dart';
import 'package:chandrima_real_estate/features/auth/controller/auth_controller.dart';
import 'package:chandrima_real_estate/features/profile/controller/profile_controller.dart';
import 'package:chandrima_real_estate/features/profile/screens/extra.dart';
import 'package:chandrima_real_estate/features/profile/screens/tenant_details_screen.dart';
import 'package:chandrima_real_estate/features/profile/widgets/build_details_row.dart';
import 'package:chandrima_real_estate/utils/app_color.dart';
import 'package:chandrima_real_estate/utils/dimensions.dart';
import 'package:chandrima_real_estate/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:get/get.dart';

class GeneralInfoTab extends StatelessWidget {
  const GeneralInfoTab({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(builder: (profileController) {
      final member = profileController.profileDetails?.data?.member;

      if (member == null) {
        return const Center(child: Text("No data available"));
      }

      return SingleChildScrollView(
        padding: const EdgeInsets.all(Dimensions.paddingSizeFifteen),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(Dimensions.radiusFive),
                child: CustomNetworkImage(
                  image: member.photo ?? '',
                  height: 150, width: 150,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(height: 5),

            Center(
              child: Text(
                member.name ?? 'N/A',
                style: poppinsMedium.copyWith(fontSize: Dimensions.fontSizeEighteen),
              ),
            ),
            const SizedBox(height: 5),

            Center(
              child: Text(
                member.status?.toUpperCase() ?? '',
                style: poppinsRegular.copyWith(
                  fontSize: Dimensions.fontSizeFourteen,
                  color: member.status == 'active' ? AppColors.green : AppColors.red,
                ),
              ),
            ),
            const SizedBox(height: 16),



            Text(
              'Member Information',
              style: poppinsMedium.copyWith(fontSize: Dimensions.fontSizeSixteen),
            ),
            const SizedBox(height: 5),

            CustomCard(
              child: Column(children: [
                BuildDetailsRow(title: 'ID', value: member.memberType),
                BuildDetailsRow(title: 'Member Name', value: member.name),
                BuildDetailsRow(title: 'Mobile', value: member.mobile),
                BuildDetailsRow(title: 'Email', value: member.email),

              ]),
            ),
            const SizedBox(height: 16),

            Text(
              'Address Information',
              style: poppinsMedium.copyWith(fontSize: Dimensions.fontSizeSixteen),
            ),
            const SizedBox(height: 5),

            CustomCard(
              child: Column(children: [
                BuildDetailsRow(title: 'Present Address', value: member.presentAddress),
                BuildDetailsRow(title: 'Permanent Address', value: member.permanentAddress),
              ]),
            ),
            const SizedBox(height: 16),

            Text(
              'Land Information',
              style: poppinsMedium.copyWith(fontSize: Dimensions.fontSizeSixteen),
            ),
            const SizedBox(height: 5),

            CustomCard(
              child: Column(children: [
                BuildDetailsRow(title: 'Quantity of Land(Kh.)', value: member.landQty),
                BuildDetailsRow(title: 'Total Land', value: member.totalLand),
              ]),
            ),
            const SizedBox(height: 16),

            Text(
              'Other Information',
              style: poppinsMedium.copyWith(fontSize: Dimensions.fontSizeSixteen),
            ),
            const SizedBox(height: 5),

            CustomCard(
              child: Column(children: [
                BuildDetailsRow(title: 'NID Number', value: member.nidNumber?.toString()),
                BuildDetailsRow(title: 'Name of Power', value: member.nameOfPower),
                BuildDetailsRow(title: 'Remarks', value: member.remarks),
                BuildDetailsRow(title: 'Member Since', value: member.memberSine),
              ]),
            ),

            SizedBox(height: 16),

            Text(
              'Documents',
              style: poppinsMedium.copyWith(fontSize: Dimensions.fontSizeSixteen),
            ),
            const SizedBox(height: 12),
            profileController.profileDetails?.data!.documents!=null?  CustomCard(
              child: Column(
                  children: [
              ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: profileController.profileDetails?.data!.documents!.length ?? 0,
                  itemBuilder: (context,index){
                    var data=profileController.profileDetails?.data!.documents![index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Document ${index+1}: ${data!.title}', style: poppinsSemiMedium.copyWith(fontSize: Dimensions.fontSizeSixteen)),
                      SizedBox(height: 100,
                        child: ListView.builder(
                          
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context,index){
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Column(
                              children: [

                                IconButton(onPressed: (){

                                 Get.to( FileViewerWebView(
                                    url:data.documents![index],
                                 ));
                                }, icon: Icon(TablerIcons.download, color: AppColors.primary,)),
                                Text("${index+1}"),
                              ],
                            ),
                          );
                        }, itemCount: data.documents!.length, shrinkWrap: true, physics: const NeverScrollableScrollPhysics(),),
                      )
                    ],
                  ),
                );
              })
              ]),
            ):SizedBox(),


            MaterialButton(
              onPressed: () {
                // profileController.logout();
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Logout Confirmation'),
                    content: const Text('Are you sure you want to log out?'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(); // Dismiss the dialog
                        },
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.find<AuthController>().removeToken();

                          Navigator.of(context).pop(); // Dismiss the dialog
                        },
                        child: const Text('Logout'),
                      ),
                    ],
                  );
                },
              );
              },

              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("  Log Out", style: poppinsBold.copyWith(color: AppColors.red)),
                  SizedBox(width: 11,),
                  Icon(Icons.logout, color: AppColors.red),
                ],
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      );
    });
  }
}