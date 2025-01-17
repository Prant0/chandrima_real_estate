import 'package:chandrima_real_estate/features/auth/screens/login_screen.dart';
import 'package:chandrima_real_estate/features/dashboard/screens/dashboard_screen.dart';
import 'package:chandrima_real_estate/features/profile/screens/add_family_member_screen.dart';
import 'package:chandrima_real_estate/routes/routes_name.dart';
import 'package:get/get.dart';

class AppRoutes {
  static appRoutes() => [

    GetPage(
      name: RoutesName.login,
      page: () => const LoginScreen(),
    ),

    GetPage(
      name: RoutesName.dashboardScreen,
      page: () => const DashboardScreen(pageIndex: 0),
    ),

    GetPage(
      name: RoutesName.addFamilyMember,
      page: () => const AddFamilyMemberScreen(),
    ),

  ];
}
