import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:chandrima_real_estate/features/complain/screens/complain_screen.dart';
import 'package:chandrima_real_estate/features/home/screens/home_screen.dart';
import 'package:chandrima_real_estate/features/invoice/screens/invoice_screen.dart';
import 'package:chandrima_real_estate/features/payment/screens/payment_screen.dart';
import 'package:chandrima_real_estate/features/profile/controller/profile_controller.dart';
import 'package:chandrima_real_estate/features/profile/screens/profile_screen.dart';
import 'package:chandrima_real_estate/utils/app_color.dart';
import 'package:chandrima_real_estate/utils/dimensions.dart';
import 'package:chandrima_real_estate/utils/styles.dart';

class DashboardScreen extends StatefulWidget {
  final int pageIndex;
  const DashboardScreen({super.key, required this.pageIndex});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;
  bool _canExit = false;

  @override
  void initState() {
    super.initState();
    ProfileController profileController = Get.find<ProfileController>();
    profileController.getProfileDetails();
    profileController.getUserInvoiceList();
    _selectedIndex = widget.pageIndex;
  }

  final List<Widget> _pages = [
    const HomeScreen(),
    const InvoiceScreen(),
   // const PaymentScreen(),*/
      ComplainScreen(  isShowAppBar: true,),
    const ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if(_selectedIndex != 0) {
          setState(() {
            _selectedIndex = 0;
          });
        }else {
          if(_canExit) {
            if (GetPlatform.isAndroid) {
              SystemNavigator.pop();
            } else if (GetPlatform.isIOS) {
              exit(0);
            }
          }
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Press back again to exit', style: TextStyle(color: Colors.white)),
            behavior: SnackBarBehavior.floating,
            backgroundColor: AppColors.green,
            duration: Duration(seconds: 2),
            margin: EdgeInsets.all(Dimensions.marginSizeTen),
          ));
          _canExit = true;

          Timer(const Duration(seconds: 2), () {
            _canExit = false;
          });
        }
      },
      child: Scaffold(
        body: _pages[_selectedIndex],
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            color: AppColors.primary,
            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
          ),
          child: Container(

            color: AppColors.white,
            padding: const EdgeInsets.symmetric(
              vertical: Dimensions.paddingSizeTen,
              horizontal: Dimensions.paddingSizeThirty,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildNavItem(icon: Icons.home, label: 'Home', index: 0),
                _buildNavItem(icon: Icons.receipt, label: 'Invoice', index: 1),
               // _buildNavItem(icon: Icons.payment, label: 'Payment', index: 2),
                 _buildNavItem(icon: Icons.error, label: 'Notice', index: 2),
                _buildNavItem(icon: Icons.person, label: 'Profile', index: 3),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required String label,
    required int index,
  }) {
    bool isSelected = _selectedIndex == index;
    return InkWell(
      onTap: () => _onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: isSelected ? AppColors.purpleColor : AppColors.grey),
          const SizedBox(height: 4),
          Text(
            label,
            style: poppinsRegular.copyWith(
              color: isSelected ? AppColors.purpleColor : AppColors.grey,
              fontSize: Dimensions.fontSizeTwelve,
              fontWeight: FontWeight.w500
            ),
          ),
        ],
      ),
    );
  }
}
