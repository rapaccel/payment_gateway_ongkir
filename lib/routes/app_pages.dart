import 'package:get/get.dart';
import 'package:payment_gateway_ongkir/SplashScreen/controllers/splash_controllers.dart';
import 'package:payment_gateway_ongkir/SplashScreen/view/splash_page.dart';
import 'package:payment_gateway_ongkir/bottomNavBar/controller/bottom_navigation.dart';
import 'package:payment_gateway_ongkir/bottomNavBar/view/bottom_navigation_page.dart';
import 'package:payment_gateway_ongkir/history/controller/history_controller.dart';
import 'package:payment_gateway_ongkir/history/view/history_page.dart';
import 'package:payment_gateway_ongkir/home/controller/home_controller.dart';
import 'package:payment_gateway_ongkir/home/view/home_page.dart';
import 'package:payment_gateway_ongkir/login/controllers/login_controller.dart';
import 'package:payment_gateway_ongkir/login/view/login_page.dart';
import 'package:payment_gateway_ongkir/order/controller/location_controller.dart';
import 'package:payment_gateway_ongkir/order/view/location_page.dart';
import 'package:payment_gateway_ongkir/profile/controller/profile_controller.dart';
import 'package:payment_gateway_ongkir/profile/view/profile_page.dart';
import 'package:payment_gateway_ongkir/register/controller/otp_controller.dart';
import 'package:payment_gateway_ongkir/register/controller/register_controller.dart';
import 'package:payment_gateway_ongkir/register/view/otp_page.dart';
import 'package:payment_gateway_ongkir/register/view/register_page.dart';
import 'package:payment_gateway_ongkir/routes/route.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: RouteName.splash,
      page: () => const SplashPage(),
      binding: BindingsBuilder(() {
        Get.put(SplashControllers());
      }),
    ),
    GetPage(
      name: RouteName.login,
      page: () => const LoginPage(),
      binding: BindingsBuilder(() {
        Get.put(LoginController());
      }),
    ),
    GetPage(
      name: RouteName.register,
      page: () => const RegisterPage(),
      binding: BindingsBuilder(() {
        Get.put(RegisterController());
      }),
    ),
    GetPage(
      name: RouteName.otp,
      page: () => const OtpPage(),
      binding: BindingsBuilder(() {
        Get.put(OtpController());
      }),
    ),
    GetPage(
      name: RouteName.bottomNav,
      page: () => BottomNavigationPage(),
      binding: BindingsBuilder(() {
        Get.put(BottomNavigation());
      }),
    ),
    GetPage(
      name: RouteName.home,
      page: () => const HomePage(),
      binding: BindingsBuilder(() {
        Get.lazyPut<HomeController>(() => HomeController());
      }),
    ),
    GetPage(
      name: RouteName.history,
      page: () => const HistoryPage(),
      binding: BindingsBuilder(() {
        Get.put(HistoryController());
      }),
    ),
    GetPage(
      name: RouteName.profile,
      page: () => const ProfilePage(),
    ),
    GetPage(
      name: RouteName.location,
      page: () => const LocationPage(),
      binding: BindingsBuilder(() {
        Get.put(LocationController());
      }),
    ),
  ];
}
