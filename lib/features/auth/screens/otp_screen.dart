import 'dart:async';
import 'package:chandrima_real_estate/features/auth/controller/auth_controller.dart';
import 'package:chandrima_real_estate/utils/app_color.dart';
import 'package:chandrima_real_estate/utils/images.dart';
import 'package:chandrima_real_estate/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

class VerifyOtpScreen extends StatefulWidget {
  const VerifyOtpScreen({super.key});

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: const TextStyle(fontSize: 20, color: Color.fromRGBO(30, 60, 87, 1), fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      border: Border.all(color:AppColors.primary),
      borderRadius: BorderRadius.circular(8),
      color: AppColors.white,
    ),
  );


  Timer? _timer;
  int _start = 90;
  bool _isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer?.cancel();
    _start = 90;
    setState(() {
      _isButtonEnabled = false;
    });
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (_start == 0) {
        setState(() {
          _isButtonEnabled = true;
        });
        timer.cancel();
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

  void _resendOtp() {
    _startTimer();
    // Add your resend OTP logic here
    print('Resend OTP');
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //resizeToAvoidBottomInset: false,
        body: GetBuilder<AuthController>(builder: (loginController){
          return SingleChildScrollView(
            padding: const EdgeInsets.only(left: 40, right: 40, top: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      margin: const EdgeInsets.only(top: 10, bottom: 10),
                      alignment: Alignment.center,
                      height: 40,
                      width: 35,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: Center(
                        child: Icon(Icons.arrow_back_ios_new_rounded,
                            size: 20, color: Colors.black),
                      ),
                    ),
                  ),
                ),
                Image.asset(
                  "${Images.logo}",
                  height: 100,
                  width: 100,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 20,
                    bottom: 40,
                  ),
                  child: Text(
                    "Chandrima Real Estate Housing",
                    style: poppinsBold.copyWith(fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "OTP Verification",
                      style: poppinsRegular.copyWith(
                          fontSize: 22, fontWeight: FontWeight.w600),
                    )),
                SizedBox(
                  height: 8,
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                        "A code has send to your registered mobile number",
                        style: poppinsRegular)),
                SizedBox(
                  height: 50,
                ),

                Text("Enter 4 Digit Code",style: poppinsRegular,),
                SizedBox(height: 20,),
                Container(
                    child: Pinput(
                      controller: loginController.otpController,
                      length: 4,

                      onCompleted: (String)async{
                        loginController.login(phone: loginController.phoneNumberController.text.toString(),
                            password: loginController.otpController.text.toString());
                      },
                      defaultPinTheme: defaultPinTheme,
                    )
                ),
                const SizedBox(height: 20),

                Text(
                  '$_start Seconds',
                  style: TextStyle(fontSize: 16, color: Colors.red),
                ),
                SizedBox(height: 20),
                // Resend OTP Button
                ElevatedButton(
                  onPressed: _isButtonEnabled ? ()async{
                    await loginController.sendOtp(phoneNumber: loginController.phoneNumberController.text.toString());
                   // await loginController.login(phone: loginController.phoneNumberController.text.toString(), password: loginController.otpController.text.toString());
                    _startTimer();
                  } : null,
                  child: Text('Resend OTP'),
                ),
                SizedBox(height: 30,),
                loginController.isLoading?CircularProgressIndicator(): SizedBox(height: 20,),

                SizedBox(height: 150,),
              ],
            ),
          );
        },)
    );
  }
}
