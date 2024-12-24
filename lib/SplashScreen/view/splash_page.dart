import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payment_gateway_ongkir/SplashScreen/controllers/splash_controllers.dart';
import 'package:payment_gateway_ongkir/assets/variabels/variabels.dart';

class SplashPage extends GetView<SplashControllers> {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('lib/assets/images/logo.png'),
      ),
      backgroundColor: ColorsData.primaryColor,
    );
  }
}
