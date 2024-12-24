import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:payment_gateway_ongkir/assets/variabels/variabels.dart';
import 'package:payment_gateway_ongkir/register/data_register.dart';

class RegisterController extends GetxController {
  late TextEditingController? emailController,
      passwordController,
      confirmPasswordController,
      nameController,
      phoneController;
  final formKey = GlobalKey<FormState>();
  @override
  void onInit() {
    nameController = TextEditingController();
    phoneController = TextEditingController();
    confirmPasswordController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  String? validateName(String value) {
    if (value.isEmpty) {
      return 'Name is required';
    }
    return null;
  }

  String? validatePhone(String value) {
    if (value.isEmpty) {
      return 'Phone is required';
    }
    return null;
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
    } else if (value.length < 6) {
      return 'Password must be at least 6 characters';
    } else if (value != confirmPasswordController!.text) {
      return 'Password not match';
    }
    return null;
  }

  String? validateConfirmPassword(String value) {
    if (value.isEmpty) {
      return 'Confirm Password is required';
    } else if (value != passwordController!.text) {
      return 'Password not match';
    }
    return null;
  }

  klikRegister(email, password, name, phone) async {
    if (formKey.currentState!.validate()) {
      final url = Variabels.baseUrl;
      var data = {'nohp': phone};
      var response = await http.post(Uri.parse("$url/api/sendWa"), body: data);
      var result = jsonDecode(response.body);
      var message = result['message'];
      if (response.statusCode == 200) {
        final registerData = RegisterData(
          email: emailController!.text,
          password: passwordController!.text,
          name: nameController!.text,
          phoneNumber: phoneController!.text,
        );
        Get.offNamed(
          '/otp',
          arguments: registerData,
        );
        Get.snackbar("success", message,
            backgroundColor: Colors.green,
            colorText: Colors.white,
            icon: const Icon(Icons.check),
            snackPosition: SnackPosition.BOTTOM);
      } else {
        Get.snackbar('Error', message,
            backgroundColor: Colors.red,
            colorText: Colors.white,
            icon: const Icon(Icons.error),
            snackPosition: SnackPosition.BOTTOM);
      }
    }
  }
}
