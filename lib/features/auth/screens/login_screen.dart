import 'package:chandrima_real_estate/common/widgets/custom_text_field.dart';
import 'package:chandrima_real_estate/utils/app_color.dart';
import 'package:chandrima_real_estate/utils/dimensions.dart';
import 'package:chandrima_real_estate/utils/images.dart';
import 'package:chandrima_real_estate/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:get/get.dart';
import 'package:chandrima_real_estate/common/widgets/custom_button.dart';
import 'package:chandrima_real_estate/routes/routes_name.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _selectedRole = 'Member';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(Dimensions.paddingSizeFifteen),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                SizedBox(height: constraints.maxHeight * 0.1),

                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(Dimensions.radiusFifteen),
                    child: Image.asset(Images.logo, height: 80),
                  ),
                ),
                const SizedBox(height: 20),

                RichText(
                  text: TextSpan(
                    text: "Let's ",
                    style: poppinsRegular.copyWith(fontSize: Dimensions.fontSizeTwentySix, color: AppColors.black),
                    children: [
                      TextSpan(
                        text: 'Sign In',
                        style: poppinsRegular.copyWith(fontSize: Dimensions.fontSizeTwentySix, color: AppColors.primary),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),

                Text(
                  'Sign in with the Chandrima Real Estate to explore our all services',
                  style: poppinsRegular.copyWith(color: AppColors.grey),
                ),
                SizedBox(height: constraints.maxHeight * 0.08),

                CustomTextField(
                  controller: _emailController,
                  hintText: 'Enter Your Email',
                  prefixIcon: TablerIcons.mail,
                ),
                const SizedBox(height: 15),

                CustomTextField(
                  controller: _passwordController,
                  hintText: 'Enter Your Password',
                  prefixIcon: TablerIcons.lock,
                  isPassword: true,
                ),

                Row(
                  children: [
                    Text("Member", style: poppinsMedium),
                    Radio<String>(
                      value: 'Member',
                      groupValue: _selectedRole,
                      onChanged: (String? value) {
                        setState(() {
                          _selectedRole = value!;
                        });
                      },
                    ),
                    const SizedBox(width: 22),

                    Text("Developer", style: poppinsMedium),
                    Radio<String>(
                      value: 'Developer',
                      groupValue: _selectedRole,
                      onChanged: (String? value) {
                        setState(() {
                          _selectedRole = value!;
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(height: constraints.maxHeight * 0.07),

                CustomButton(
                  buttonText: 'Sign In',
                  onPressed: (){
                    Get.toNamed(RoutesName.getDashboardScreen());
                  },
                ),
                const SizedBox(height: 10),

                Center(
                  child: TextButton(
                    onPressed: () {

                    },
                    child: Text(
                      'Forgot Password?',
                      style: poppinsRegular.copyWith(color: AppColors.primary),
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      ),
    );
  }
}