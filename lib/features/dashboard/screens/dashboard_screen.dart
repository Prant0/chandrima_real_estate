import 'package:chandrima_real_estate/features/complain/screens/complain_screen.dart';
import 'package:chandrima_real_estate/features/home/screens/home_screen.dart';
import 'package:chandrima_real_estate/features/invoice/screens/invoice_screen.dart';
import 'package:chandrima_real_estate/features/payment/screens/payment_screen.dart';
import 'package:chandrima_real_estate/features/profile/controller/profile_controller.dart';
import 'package:chandrima_real_estate/features/profile/screens/profile_screen.dart';
import 'package:chandrima_real_estate/utils/app_color.dart';
import 'package:chandrima_real_estate/utils/dimensions.dart';
import 'package:chandrima_real_estate/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardScreen extends StatefulWidget {
  final int pageIndex;
  const DashboardScreen({super.key, required this.pageIndex});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    ProfileController profileController = Get.find<ProfileController>();
    profileController.getProfileDetails();

    _selectedIndex = widget.pageIndex;
  }

  final List<Widget> _pages = [
    const HomeScreen(),
    const InvoiceScreen(),
    const PaymentScreen(),
    const ComplainScreen(),
    const ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: AppColors.primary,
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
        ),
        child: Container(
          color: AppColors.white,
          padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeTen, horizontal: Dimensions.paddingSizeFifteen),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildNavItem(icon: Icons.home, label: 'Home', index: 0),
              _buildNavItem(icon: Icons.receipt, label: 'Invoice', index: 1),
              _buildNavItem(icon: Icons.payment, label: 'Payment', index: 2),
              _buildNavItem(icon: Icons.error, label: 'Complain', index: 3),
              _buildNavItem(icon: Icons.person, label: 'Profile', index: 4),
            ],
          ),
        ),
      ),
    );
  }

  
  Widget _buildNavItem({required IconData icon, required String label, required int index}) {
    bool isSelected = _selectedIndex == index;
    return InkWell(
      onTap: () => _onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: isSelected ? AppColors.primary : AppColors.grey),
          const SizedBox(height: 4),
          
          Text(label, style: poppinsRegular.copyWith(color: isSelected ? AppColors.primary : AppColors.grey, fontSize: Dimensions.fontSizeTwelve)),
        ],
      ),
    );
  }
}
