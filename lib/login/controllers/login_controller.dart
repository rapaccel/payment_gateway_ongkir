import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:payment_gateway_ongkir/assets/variabels/variabels.dart';
import 'package:http/http.dart' as http;
import 'package:payment_gateway_ongkir/routes/route.dart';

class LoginController extends GetxController {
  late TextEditingController? emailController, passwordController;
  final formKey = GlobalKey<FormState>();
  final getStorage = GetStorage();
  var email = '';
  var password = '';
  RxBool isLoading = false.obs;
  @override
  void onInit() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  String? validateEmail(String value) {
    if (value.isEmpty) {
      return 'Email is required';
    } else if (!GetUtils.isEmail(value)) {
      return 'Email is invalid';
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.isEmpty) {
      return 'Password is required';
    }
    return null;
  }

  klikLogin(email, password) async {
    if (formKey.currentState!.validate()) {
      isLoading.value = true;
      var url = Variabels.baseUrl;
      var data = {
        'email': email,
        'password': password,
      };
      var response =
          await http.post(Uri.parse("$url/api/users/login"), body: data);
      var result = jsonDecode(response.body);
      var message = result['message'];
      if (response.statusCode == 200) {
        Get.offAllNamed(RouteName.bottomNav);
        final user = result['user'];
        GetStorage().write('id', user['id']);
        GetStorage().write('name', user['name']);
        GetStorage().write('email', user['email']);
        GetStorage().write('phone_number', user['phone_number']);
        GetStorage().write('id', result['id']);
        print(
            'name: ${user['name']}, email: ${user['email']}, phone_number: ${user['phone_number']}');
        Get.snackbar("success", message,
            backgroundColor: Colors.green,
            colorText: Colors.white,
            icon: const Icon(Icons.check),
            snackPosition: SnackPosition.BOTTOM);
      } else {
        isLoading.value = false;
        Get.snackbar('Error', message,
            backgroundColor: Colors.red,
            colorText: Colors.white,
            icon: const Icon(Icons.error),
            snackPosition: SnackPosition.BOTTOM);
      }
    }
  }
}
