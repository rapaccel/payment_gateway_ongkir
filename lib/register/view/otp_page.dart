import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:payment_gateway_ongkir/register/controller/otp_controller.dart';
import 'package:pinput/pinput.dart';

class OtpPage extends GetView<OtpController> {
  const OtpPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Center(
                child: Text('Otp Page',
                    style:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(height: 50),
              const Text("Silahkan masukkan kode OTP yang telah dikirim ke wa",
                  style: TextStyle(fontSize: 16)),
              const SizedBox(height: 120),
              Pinput(
                length: 6,
                autofocus: true,
                inputFormatters: [
                  FilteringTextInputFormatter
                      .digitsOnly, // Hanya angka yang diizinkan
                ],
                onCompleted: (pin) {
                  controller.otpKlik(pin);
                },
                keyboardType: TextInputType.number,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
