import 'package:get/get.dart';
import 'package:payment_gateway_ongkir/bottomNavBar/controller/bottom_navigation.dart';
import 'package:payment_gateway_ongkir/history/controller/history_controller.dart';
import 'package:payment_gateway_ongkir/home/controller/home_controller.dart';
import 'package:payment_gateway_ongkir/profile/controller/profile_controller.dart';

class BottomNavigationBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(BottomNavigation());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<HistoryController>(() => HistoryController());
    Get.lazyPut<ProfileController>(() => ProfileController());
  }
}
