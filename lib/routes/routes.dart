import 'package:chandrima_real_estate/features/auth/screens/login_screen.dart';
import 'package:chandrima_real_estate/features/auth/screens/register_screen.dart';
import 'package:chandrima_real_estate/features/home/screens/home_screen.dart';
import 'package:chandrima_real_estate/features/nav_bar/screen/nav_bar_screen.dart';
import 'package:chandrima_real_estate/routes/routes_name.dart';
import 'package:get/get.dart';

class AppRoutes {
  static appRoutes() => [


    GetPage(
      name: RoutesName.login,
      page: () => const LoginScreen(),
    ),

    GetPage(
      name: RoutesName.register,
      page: () => const RegisterScreen(),
    ),
 GetPage(
      name: RoutesName.home,
      page: () => const Homepage(),
    ),

    GetPage(
      name: RoutesName.navBar,
      page: () => const NavBarScreen(),
    ),


  ];
}
