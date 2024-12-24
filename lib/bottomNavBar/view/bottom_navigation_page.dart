import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payment_gateway_ongkir/assets/variabels/variabels.dart';
import 'package:payment_gateway_ongkir/bottomNavBar/controller/bottom_navigation.dart';
import 'package:payment_gateway_ongkir/history/controller/history_controller.dart';
import 'package:payment_gateway_ongkir/history/view/history_page.dart';
import 'package:payment_gateway_ongkir/home/controller/home_controller.dart';
import 'package:payment_gateway_ongkir/home/view/home_page.dart';
import 'package:payment_gateway_ongkir/profile/controller/profile_controller.dart';
import 'package:payment_gateway_ongkir/profile/view/profile_page.dart';

class BottomNavigationPage extends GetView<BottomNavigation> {
  BottomNavigationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavigation>(builder: (controller) {
      return Scaffold(
          body: IndexedStack(
            index: controller.currentIndex,
            children: [
              GetBuilder<HomeController>(
                init: HomeController(),
                builder: (controller) {
                  return const HomePage();
                },
              ),
              GetBuilder<HistoryController>(
                builder: (controller) {
                  return const HistoryPage();
                },
                init: HistoryController(),
              ),
              GetBuilder<ProfileController>(
                builder: (controller) {
                  return const ProfilePage();
                },
                init: ProfileController(),
              )
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.history),
                label: 'History',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
            currentIndex: controller.currentIndex,
            onTap: controller.changeIndex,
            selectedItemColor: ColorsData.primaryColor,
            unselectedItemColor: Colors.grey,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            showSelectedLabels: false,
          ));
    });
  }
}
