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
        appBar: AppBar(
          toolbarHeight: 10,
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.secondary,
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
        body: const TabBarView(
          children: [
            GeneralInfoTab(),
            LandInformationTab(),
            FamilyMemberTab(),
            TenantTab(),
            PaymentsTab(),
            ComplaintTab(),
            DocumentTab(),
          ],
        ),
      ),
    );
  }
}

// Individual widgets for each tab's content
class GeneralInfoTab extends StatelessWidget {
  const GeneralInfoTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'General Info Content',
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}

class LandInformationTab extends StatelessWidget {
  const LandInformationTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Land Information Content',
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}

class FamilyMemberTab extends StatelessWidget {
  const FamilyMemberTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Family Member Content',
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}

class TenantTab extends StatelessWidget {
  const TenantTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Tenant Content',
        style: TextStyle(fontSize: 18),
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
