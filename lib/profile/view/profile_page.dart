import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payment_gateway_ongkir/profile/controller/profile_controller.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Menggunakan Obx untuk memperbarui UI secara reaktif
              Obx(() {
                return Text(
                  'Name: ${controller.name}',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                );
              }),
              SizedBox(height: 16),
              Obx(() {
                return Text(
                  'Email: ${controller.email}',
                  style: TextStyle(fontSize: 16),
                );
              }),
              SizedBox(height: 16),
              Obx(() {
                return Text(
                  'Phone Number: ${controller.phoneNumber}',
                  style: TextStyle(fontSize: 16),
                );
              }),
              SizedBox(height: 16),
              // Tombol untuk mengedit profil
              ElevatedButton(
                onPressed: () {
                  Get.offAllNamed('/login');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                child: Text('Logout', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
