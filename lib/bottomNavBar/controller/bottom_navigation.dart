import 'package:get/get.dart';

class BottomNavigation extends GetxController {
  var currentIndex = 0;
  var idTab = Get.arguments;

  void changeIndex(int index) {
    currentIndex = index;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    update();
  }

  @override
  void onReady() {
    if (idTab != null) {
      currentIndex = idTab;
    }
    super.onReady();
  }
}
