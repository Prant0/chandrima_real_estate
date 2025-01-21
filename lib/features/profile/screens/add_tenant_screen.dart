import 'package:chandrima_real_estate/common/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class AddTenantScreen extends StatefulWidget {
  const AddTenantScreen({super.key});

  @override
  State<AddTenantScreen> createState() => _AddTenantScreenState();
}

class _AddTenantScreenState extends State<AddTenantScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Add Tenant'),
    );
  }
}
