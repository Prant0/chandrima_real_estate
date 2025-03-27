 import 'package:chandrima_real_estate/features/advertise/screen/add_advertise.dart';
import 'package:chandrima_real_estate/features/advertise/screen/my_advertise_screen.dart';
import 'package:chandrima_real_estate/features/auth/controller/auth_controller.dart';
 import 'package:chandrima_real_estate/features/home/screens/help_line.dart';
import 'package:chandrima_real_estate/features/home/screens/notification_screen.dart';
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              height: 250,
              color: Colors.black87,
              child: Image.asset(Images.logo ,height: 250,)),

          SizedBox(height: 10,),
          MaterialButton(
            padding: EdgeInsets.symmetric(horizontal: 12,vertical: 20),
            onPressed: (){
              Get.to(AddAdvertiseScreen());
            },
          child: Row(
            children: [
              Icon(TablerIcons.ad),
              SizedBox(width: 16,),
              Text("Add Advertise",style: poppinsBold,),
            ],
          ),

          ),
          Divider(),
          SizedBox(height: 10,),
          MaterialButton(
            padding: EdgeInsets.symmetric(horizontal: 12,vertical: 20),
            onPressed: (){
             // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MyAdvertiseScreen()));
               Get.to(MyAdvertiseScreen());
            },
          child: Row(
            children: [
              Icon(TablerIcons.ad_2),
              SizedBox(width: 16,),
              Text("My Advertise",style: poppinsBold,),
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
              Icon(TablerIcons.help),
              SizedBox(width: 16,),
              Text("Help Line",style: poppinsBold,),
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
              Icon(TablerIcons.notification),
              SizedBox(width: 16,),
              Text("Notifications",style: poppinsBold,),
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
            children: [
              Icon(TablerIcons.logout_2),
              SizedBox(width: 16,),
              Text("Log Out",style: poppinsBold,),
            ],
          ),

          ),


          Divider(),
        ],
      ),
    );
  }
}
