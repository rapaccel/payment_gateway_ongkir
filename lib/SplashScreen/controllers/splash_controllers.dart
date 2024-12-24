import 'package:get/get.dart';
import 'package:payment_gateway_ongkir/routes/route.dart';

class SplashControllers extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    Future.delayed(const Duration(seconds: 3), () {
      Get.offAllNamed(RouteName.login);
    });
  }

  @override
  void onClose() {
    super.onClose();
  }
}
