import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payment_gateway_ongkir/assets/variabels/variabels.dart';
import 'package:payment_gateway_ongkir/register/data_register.dart';
import 'package:http/http.dart' as http;

class OtpController extends GetxController {
  late final RegisterData registerData;

  @override
  void onInit() {
    registerData = Get.arguments as RegisterData;
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  otpKlik(value) {
    final url = Variabels.baseUrl;
    final data = {
      'name': registerData.name,
      'phone_number': registerData.phoneNumber,
      'email': registerData.email,
      'password': registerData.password,
      'otp': value,
    };

    http
        .post(Uri.parse("$url/api/users/register"), body: data)
        .then((response) {
      final result = response.body;
      if (response.statusCode == 200) {
        Get.offAllNamed('/login');
        Get.snackbar("success", result,
            backgroundColor: Colors.green, colorText: Colors.white);
      } else {
        Get.snackbar("error", result,
            backgroundColor: Colors.red, colorText: Colors.white);
      }
    });
  }
}
