import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:chandrima_real_estate/common/widgets/custom_button.dart';
import 'package:chandrima_real_estate/common/widgets/default_app_bar_view.dart';
import 'package:chandrima_real_estate/features/auth/controller/auth_controller.dart';
import 'package:chandrima_real_estate/helper/validators.dart';
import 'package:chandrima_real_estate/utils/dimensions.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _companyWebsiteController = TextEditingController();
  final TextEditingController _roleController = TextEditingController();
  final TextEditingController _positionController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _companySizeController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    _firstNameController.text = 'John';
    _lastNameController.text = 'Doe';
    _phoneController.text = '0712345678';
    _emailController.text = 'ranarr.dev@gmail.com';
    _passwordController.text = '1516';
    _companyWebsiteController.text = 'www.example.com';
    _roleController.text = 'Developer';
    _positionController.text = 'Software Engineer';
    _countryController.text = 'Kenya';
    _companySizeController.text = '100-200';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
    );
  }
}
