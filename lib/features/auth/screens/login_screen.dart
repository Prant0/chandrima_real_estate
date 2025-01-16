import 'package:chandrima_real_estate/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:chandrima_real_estate/common/widgets/custom_button.dart';
import 'package:chandrima_real_estate/common/widgets/default_app_bar_view.dart';
import 'package:chandrima_real_estate/features/auth/controller/auth_controller.dart';
import 'package:chandrima_real_estate/helper/validators.dart';
import 'package:chandrima_real_estate/routes/routes_name.dart';
import 'package:chandrima_real_estate/utils/dimensions.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _selectedRole = 'Member';

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              SizedBox(height: 50.0),

              RichText(
                text: TextSpan(
                  text: "Let's ",
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 26,
                  ),
                  children: const [
                    TextSpan(
                      text: 'Sign In',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 26,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ],
                ),
              ),
               SizedBox(height: 12.0),
              Text(
                'Sign in with the Chandrima Real Estate to explore our all services',
                style: GoogleFonts.poppins(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 56.0),
              // DropdownButtonFormField<String>(

              const SizedBox(height: 16.0),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[200],
                  hintText: 'Enter Your Email',
                  prefixIcon: const Icon(TablerIcons.mail, color: Colors.black),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16), // Rounded corners
                    borderSide: BorderSide.none, // No border outline
                  ),
                ),
                validator: (value) => multiValidator(
                  value,
                  [
                    requiredValidator,
                    //emailValidator,
                  ],
                ),
              ),
              SizedBox(height: 12.0),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[200],
                  hintText: 'Enter Your Password',
                  prefixIcon: const Icon(TablerIcons.lock, color: Colors.black),
                  suffixIcon: const Icon(Icons.visibility_off, color: Colors.black),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16), // Rounded corners
                    borderSide: BorderSide.none, // No border outline
                  ),
                ),
                validator: (value) => multiValidator(
                  value,
                  [
                    requiredValidator,
                  ],
                ),
              ),

              Row(
                children: [
                  Text("Member",style: robotoMedium,),
                  Radio<String>(
                    value: 'Member',
                    groupValue: _selectedRole,
                    onChanged: (String? value) {
                      setState(() {
                        _selectedRole = value!;
                      });
                    },
                  ),
                  SizedBox(width: 22,),
                  Text("Developer",style: robotoMedium,),
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

              SizedBox(height: 55.0),

              CustomButton(
                buttonText: 'Sign In',
                margin: const EdgeInsets.symmetric(horizontal: 20),
               // isLoading: authController.isLoading,
                onPressed: (){
                  Get.toNamed(RoutesName.getNavBarScreen());
                },
              ),
              SizedBox(height: 20,),
              Center(
                child: InkWell(
                  onTap: () {},
                  child: Text(
                    'Forgot Password?',
                    style: GoogleFonts.poppins(
                      color: Colors.blue,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),


              SizedBox(height: 40.0),
            ],
          ),
        ),
      ),
    );
  }
}