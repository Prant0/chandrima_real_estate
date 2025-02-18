import 'package:chandrima_real_estate/features/complain/screens/complain_screen.dart';
import 'package:chandrima_real_estate/features/profile/widgets/family_member_tab.dart';
import 'package:chandrima_real_estate/features/profile/widgets/general_info_tab.dart';
import 'package:chandrima_real_estate/features/profile/widgets/land_information_tab.dart';
import 'package:chandrima_real_estate/features/profile/widgets/tenant_tab.dart';
import 'package:chandrima_real_estate/utils/app_color.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7, // Number of tabs
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          toolbarHeight: 10,
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.purpleColor,
          bottom: TabBar(
            tabAlignment: TabAlignment.start,
            isScrollable: true,
            indicatorColor: AppColors.white,
            labelColor: AppColors.white,
            unselectedLabelColor: AppColors.white.withOpacity(0.5),
            tabs: const [
              Tab(text: 'General Info'),
              Tab(text: 'Land Information'),
              Tab(text: 'Family Member'),
              Tab(text: 'Tenant'),
              Tab(text: 'Payments'),
              Tab(text: 'Complaint'),
              Tab(text: 'Document'),
            ],
          ),
        ),
        body:   TabBarView(
          children: [
            GeneralInfoTab(),
            LandInformationTab(),
            FamilyMemberTab(),
            TenantTab(),
            PaymentsTab(),
            ComplainScreen(isShowAppBar: false),
            DocumentTab(),
          ],
        ),
      ),
    );
  }
}

class PaymentsTab extends StatelessWidget {
  const PaymentsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Payments Content',
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}

class ComplaintTab extends StatelessWidget {
  const ComplaintTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Complaint Content',
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}

class DocumentTab extends StatelessWidget {
  const DocumentTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Document Content',
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}
