import 'package:chandrima_real_estate/features/auth/controller/auth_controller.dart';
import 'package:chandrima_real_estate/routes/routes_name.dart';
import 'package:chandrima_real_estate/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    AuthController authController=Get.find<AuthController>();
   bool isLogin= authController.isLoggedIn();
   if(isLogin){
      Future.delayed(const Duration(milliseconds: 1500), () {
        Get.offNamed(RoutesName.dashboardScreen);
      });
   }else{
      Future.delayed(const Duration(milliseconds: 1500), () {
        Get.offNamed(RoutesName.login);
      });
   }

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      backgroundColor: Color(0xff1E1E1E),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                color: Colors.red,
                child: Image.asset(Images.logo, height: 150, width: 500,fit: BoxFit.cover,)),
            Text("Welcome to Chandrima Model Town", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
            SizedBox(height: 50),
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
