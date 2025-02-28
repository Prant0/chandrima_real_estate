import 'package:chandrima_real_estate/features/auth/screens/login_screen.dart';
import 'package:chandrima_real_estate/features/dashboard/screens/dashboard_screen.dart';
import 'package:chandrima_real_estate/features/gate_pass/screens/gate_pass_screen.dart';
import 'package:chandrima_real_estate/features/home/screens/splash_screen.dart';
import 'package:chandrima_real_estate/features/profile/screens/add_family_member_screen.dart';
import 'package:chandrima_real_estate/features/profile/screens/add_tenant_screen.dart';
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
      page: () =>   DashboardScreen(pageIndex: 0,profilePageIndex: 0),
    ),

    GetPage(
      name: RoutesName.addFamilyMember,
      page: () => const AddFamilyMemberScreen(),
    ),

    GetPage(
      name: RoutesName.addTenant,
      page: () => const AddTenantScreen(),
    ),
    GetPage(
      name: RoutesName.splash_screen,
      page: () => const SplashScreen(),
    ),

    GetPage(
      name: RoutesName.gatePassScreen,
      page: () => const GatePassScreen(),
    ),
  ];
}
