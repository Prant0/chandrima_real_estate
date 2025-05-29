 import 'package:chandrima_real_estate/common/widgets/custom_snackbar.dart';
import 'package:chandrima_real_estate/features/advertise/screen/add_advertise.dart';
import 'package:chandrima_real_estate/features/advertise/screen/my_advertise_screen.dart';
import 'package:chandrima_real_estate/features/auth/controller/auth_controller.dart';
import 'package:chandrima_real_estate/features/gate_pass/screens/add_gate_pass_screen.dart';
 import 'package:chandrima_real_estate/features/home/screens/help_line.dart';
import 'package:chandrima_real_estate/features/home/screens/notification_screen.dart';
import 'package:chandrima_real_estate/features/profile/controller/profile_controller.dart';
import 'package:chandrima_real_estate/utils/app_color.dart';
import 'package:chandrima_real_estate/utils/images.dart';
import 'package:chandrima_real_estate/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:get/get.dart';


class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return   Drawer(
      width: MediaQuery.of(context).size.width * 0.7,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0)
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                height: 120,
                color: Colors.black87,
                width: double.infinity,
                child: Image.asset(Images.logo ,fit: BoxFit.cover,),),
        
            SizedBox(height: 10,),
           /* MaterialButton(
              padding: EdgeInsets.symmetric(horizontal: 12,vertical: 20),
              onPressed: (){
                Get.to(AddAdvertiseScreen());
              },
            child: Row(
              children: [
                Icon(TablerIcons.ad,color: AppColors.primary,),
                SizedBox(width: 16,),
                Text("Add Advertise",style: poppinsBold.copyWith(color: AppColors.black),),
              ],
            ),
        
            ),
            Divider(),*/
            SizedBox(height: 10,),
            MaterialButton(
              padding: EdgeInsets.symmetric(horizontal: 12,vertical: 20),
              onPressed: (){
               // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MyAdvertiseScreen()));
                 Get.to(MyAdvertiseScreen());
              },
            child: Row(
              children: [
                Icon(TablerIcons.ad_2,color: AppColors.primary,),
                SizedBox(width: 16,),
                Text("My Advertise",style: poppinsBold.copyWith(color: AppColors.black),),
              ],
            ),
        
            ),
            Divider(),

            MaterialButton(
              padding: EdgeInsets.symmetric(horizontal: 12,vertical: 20),
              onPressed: (){
                Get.to(AddGatePassScreen());
              },
            child: Row(
              children: [
                Icon(TablerIcons.id_badge_2,color: AppColors.primary,),
                SizedBox(width: 16,),
                Text("Request Gate Pass",style: poppinsBold.copyWith(color: AppColors.black),),
              ],
            ),
            ),
            Divider(),
            MaterialButton(
              padding: EdgeInsets.symmetric(horizontal: 12,vertical: 20),
              onPressed: (){
                Get.to(NotificationScreen());
              },
            child: Row(
              children: [
                Icon(TablerIcons.notification,color: AppColors.primary,),
                SizedBox(width: 16,),
                Text("Notifications",style: poppinsBold.copyWith(color: AppColors.black),),
              ],
            ),
            ),
            Divider(),







            MaterialButton(
              padding: EdgeInsets.symmetric(horizontal: 12,vertical: 20),
              onPressed: (){
                showCustomSnackBar("Coming Soon");
              },
            child: Row(
              children: [
                Icon(TablerIcons.news,color: AppColors.primary,),
                SizedBox(width: 16,),
                Text("News",style: poppinsBold.copyWith(color: AppColors.black),),
              ],
            ),
            ),
            Divider(),MaterialButton(
              padding: EdgeInsets.symmetric(horizontal: 12,vertical: 20),
              onPressed: (){
                showCustomSnackBar("Coming Soon");
              },
            child: Row(
              children: [
                Icon(TablerIcons.servicemark,color: AppColors.primary,),
                SizedBox(width: 16,),
                Text("Services",style: poppinsBold.copyWith(color: AppColors.black),),
              ],
            ),
            ),
            Divider(),MaterialButton(
              padding: EdgeInsets.symmetric(horizontal: 12,vertical: 20),
              onPressed: (){
                showCustomSnackBar("Coming Soon");
              },
            child: Row(
              children: [
                Icon(TablerIcons.viewport_tall,color: AppColors.primary,),
                SizedBox(width: 16,),
                Text("Vote",style: poppinsBold.copyWith(color: AppColors.black),),
              ],
            ),
            ),
            Divider(),MaterialButton(
              padding: EdgeInsets.symmetric(horizontal: 12,vertical: 20),
              onPressed: (){
                showCustomSnackBar("Coming Soon");
              },
            child: Row(
              children: [
                Icon(TablerIcons.playlist_add,color: AppColors.primary,),
                SizedBox(width: 16,),
                Text("Add Post",style: poppinsBold.copyWith(color: AppColors.black),),
              ],
            ),
            ),

            Divider(),
            MaterialButton(
              padding: EdgeInsets.symmetric(horizontal: 12,vertical: 20),
              onPressed: (){
                Get.to(HelpLineScreen(
                  isBackButton: true,
                ));
              },
              child: Row(
                children: [
                  Icon(TablerIcons.help,color: AppColors.primary,),
                  SizedBox(width: 16,),
                  Text("Help Line",style: poppinsBold.copyWith(color: AppColors.black),),
                ],
              ),

            ),
            Divider(),
            MaterialButton(
              padding: EdgeInsets.symmetric(horizontal: 12,vertical: 20),
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
                            Get.find<ProfileController>().clearData();

                            Navigator.of(context).pop(); // Dismiss the dialog
                          },
                          child:   Text('Logout',style: poppinsMedium.copyWith(color: AppColors. black),),
                        ),
                      ],
                    );
                  },
                );
              },
            child: Row(
              children: [
                Icon(TablerIcons.logout_2,color: AppColors.primary,),
                SizedBox(width: 16,),
                Text("Log Out",style: poppinsBold,),
              ],
            ),
        
            ),
        
        
            Divider(),
          ],
        ),
      ),
    );
  }
}
